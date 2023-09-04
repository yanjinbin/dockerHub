# 使用官方 MySQL 镜像作为基础镜像
FROM mysql:8.0.32

# 设置工作目录
WORKDIR /app

# 将 MySQL 配置文件复制到容器中
COPY my.cnf /etc/mysql/my.cnf

# 更改 MySQL 数据存储目录的权限，确保 MySQL 可以访问该目录
RUN mkdir /var/lib/mysql-data && chown -R mysql:mysql /var/lib/mysql-data

# 设置 MySQL 数据存储目录
ENV MYSQL_DATADIR=/var/lib/mysql-data

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=123456

# 暴露 MySQL 服务端口
EXPOSE 3306

# 启动 MySQL 服务
CMD ["mysqld"]
