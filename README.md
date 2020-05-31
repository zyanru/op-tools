# op-tools

## mycurl.sh

主要用于HTTP并发流量测试。比如，每间隔2秒发送5个请求，需要发送10个：

```
$ ./mycurl.sh --site www.baidu.com --thread 5 --count 10 --time 2
2019-08-26 00:42:41 remote_ip: 39.156.66.18 http_code: 200
2019-08-26 00:42:41 remote_ip: 39.156.66.18 http_code: 200
2019-08-26 00:42:41 remote_ip: 39.156.66.18 http_code: 200
2019-08-26 00:42:41 remote_ip: 39.156.66.18 http_code: 200
2019-08-26 00:42:41 remote_ip: 39.156.66.14 http_code: 200
2019-08-26 00:42:43 remote_ip: 39.156.66.18 http_code: 200
2019-08-26 00:42:43 remote_ip: 39.156.66.18 http_code: 200
2019-08-26 00:42:43 remote_ip: 39.156.66.18 http_code: 200
2019-08-26 00:42:43 remote_ip: 39.156.66.18 http_code: 200
2019-08-26 00:42:43 remote_ip: 39.156.66.18 http_code: 200

```

## gecko.sh

场景主要用于：`tail -n0 -f <logfile>`, 观察某个日志文件的输出，一定时间后自杀，然后分析输出的日志内容；如此反复，周期性的分析样本日志。

这个脚本仅提供一个思路框架，task需要自己根据实际情况CODE



