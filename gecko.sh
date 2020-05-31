#!/bin/bash
# Author ZhangYR<375092859@qq.com>

# 定义需要tail分析的日志文件和一个tail后输出的临时文件
RAW_LOGFILE=${1:=/var/log/nginx/access.log}
TMP_LOGFILE=$(mktemp /tmp/gecko.XXXXX)
## 
## PROC_SLEEPTIME >= WORK_SLEEPTIME
WORK_SLEEPTIME=${2:=60}
PROC_SLEEPTIME=${3:=65}

help()
{
    cat <<EOF
Usage:
    $0 <LogFile> <work time(sec)> <proc time(sec)>
Example:
    $0 /var/log/nginx/access.log 10 15
 
EOF
}

task()
{
    # 额外的任务
    # 可以分析$TMP_LOGFILE中的内容，然后各种计算、格式化输出
    # Clear $TMP_LOGFILE
    > $TMP_LOGFILE
}

reborn()
{
    # 自杀
    # $! 代表最后一个执行的后台进程ID
    echo "kill ProcessID: $!"
    kill $!
    # 自杀后，执行额外的任务
    task
}

main()
{
    echo "My ProcessID: $$"
    tail -n0 -f "${RAW_LOGFILE}" >> "$TMP_LOGFILE" &
    trap reborn EXIT 0
    # 持续 tail 某个日志文件多长时间
    sleep $WORK_SLEEPTIME
    # 当$WORK_SLEEPTIME时间完成后，给trap发送信号：exit 0
    exit 0
}

if [ $# -lt 3 ]
then
    help
    exit 1
fi

while true
do
    # 每隔多久（$PROC_SLEEPTIME），执行一次main
    main &
    sleep $PROC_SLEEPTIME
done

