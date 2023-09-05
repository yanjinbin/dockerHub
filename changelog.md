# v0.0.1
# @since 2023-06-09 上午9:33:03
# mysql redis mongodb kafka 的 docker compose 和dockerfile 

# v0.0.2
# @since 2023-09-05 下午4:25:11

```shell
docker-compose logs [cotainer-name]
查看具体服务的日志信息
```

执行
```shell
command: ["mysqld", "--default-authentication-plugin=mysql_native_password"]
```
解决
```txt
 ERROR 1410 (42000) at line 10: You are not allowed to create a user with GRANT
```
**init 执行顺序 按照字典序来的**
