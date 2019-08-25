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
