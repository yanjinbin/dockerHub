# 使用官方的 alpine 镜像作为基础镜像
FROM redis:6.2


# 将配置文件复制到容器中
COPY redis.conf /etc/redis/redis.conf

VOLUME /data

# 暴露 Redis 默认端口
EXPOSE 6379

# 启动 Redis 服务
CMD ["redis-server", "/etc/redis/redis.conf"]
