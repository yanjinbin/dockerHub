# 使用官方MongoDB镜像作为基础镜像
FROM mongo:6.0.6

# 将自定义的配置文件复制到容器中
COPY mongod.conf /etc/mongod.conf

# 暴露MongoDB默认端口号，可选
EXPOSE 27017

# 启动MongoDB服务
CMD ["mongod", "-f", "/etc/mongod.conf"]
