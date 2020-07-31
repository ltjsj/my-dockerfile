### docker run -i -p 9111:9111 -p9222:22 -p9333:3306 -p9444:8080  -e MYSQL_ROOT_PASSWORD=root -e ROOT_PASS="root" -v /root/supervisor/volume-conf/:/etc/supervisor.d/  test


### dnsmasql from 
https://github.com/jpillora/docker-dnsmasq

### sshd server 运行shell脚本报错“run.sh: line 6: syntax error: unexpected end of file”

原因：该脚本在windows下编辑或者在windows打开保存过。

DOS下文件和Linux下文件格式差异问题导致的。

DOS下的文本文件是以\r\n作为断行标志的，表示成十六进制就是0D 0A。而Unix下的文本文件是以\n作为断行标志的，表示成十六进制就是0A。

解决方法：

使用下面的命令将文件格式设置为unix格式即可解决上述错误。
```$xslt
vi M.txt
:set fileformat=unix
:wq
```


### super-dev-env:v1.2 startup run

```$xslt
docker run -i -p 9111:9111 -p 9222:22 -p 9444:8080 -p 9666:8088 -e ROOT_PASS="root" -v /root/docker/volume-conf/:/etc/supervisor.d/ ltjsj/super-dev-env:v1.2
```
