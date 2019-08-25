#!/bin/bash
# Author ZhangYR<375092859@qq.com>

help()
{
    cat <<EOF
Usage:
    $0 [--proxy proxy_ip:port] --site sitename --thread num --count num --time sec
Example:
    $0 --site www.baidu.com --thread 5 --count 50 --time 2
  OR
    $0 --proxy 1.1.1.1:80 --site www.baidu.com --thread 5 --count 50 --time 2
Author   
    ZhangYR<375092859@qq.com>
 
EOF
}

mycurl()
{
    curl -H 'User-Agent: Mozilla/5.0  Curl Test' --compressed --connect-timeout 10 $1 $2 -s -o /dev/null -I -w "remote_ip: %{remote_ip} http_code: %{http_code}" "$site" 
}

tasks()
{
    if [ $proxy ]
    then
        http=`mycurl -x $proxy_ip` && {
          datestr=`date +'%F %T'`
          echo $datestr $http
        } 
    else
        http=`mycurl` && {
          datestr=`date +'%F %T'`
          echo $datestr $http
        } 
    fi
}

main()
{
    tmp_fifo="/tmp/$$.fifo"
    mkfifo $tmp_fifo
    exec 6<>$tmp_fifo
    rm $tmp_fifo

    for ((i=0; i<thread; i++))
    do
        echo 
    done >&6
    
    for ((num=0; num<count; num++))
    do
        read -u6
        {
            tasks
            sleep $time 
            echo >&6
        }&
    done

    wait
    exec 6>&-
    exit 0
}

while [ -n "$1" ]
do
    case "$1" in
        --proxy)
           proxy=true
           proxy_ip="$2" 
           shift
           ;;
        --site)
           site=$2
           shift
           ;;
        --thread)
           thread=$2
           shift
           ;;
        --count)
           count=$2
           shift
           ;;
    	--time)
    	   time=$2
    	   shift
    	   ;;
        *)
           help
           ;;
    esac
    shift 
done

if [ $site ] && [ $thread ] &&  [ $count ] && [ $time ] 
then
    main
fi
