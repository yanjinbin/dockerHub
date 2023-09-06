docker-compose & dockerfile boilerplate templates 
for mysql, redis, mongodb, kafka, nacos(config management), xxljob(job scheduler)

based on makefile 
run this command to start all services, all services are out-of-the-box, no need to config anything furthermore
```shell
make docker-run
```



| service                   | image(with version) | port  | username/password          | amd64 | arm64v8 | depends on |
|---------------------------|--------|-------|----------------------------|-------|---------|------------|
| mysql                     | mysql:8.0.32 | 3306  | root/123456,test_01/123456 | ✓     | ✓       |            |
| redis                     | redis:5.0.14 | 6379  | auth: 1234                 | ✓     | ✓       |            |
| mongo                     | mongo:6.0.6 | 27017 |                            | ✓     | ✓       |            |
| confluentinc/cp-kafka     | confluentinc/cp-kafka:7.5.0       | 9092  |                            | ✓     | ✓       | zookeeper  |
| confluentinc/cp-zookeeper | confluentinc/cp-zookeeper:7.5.0 | 2181  |                            | ✓     | ✓       |            |
| kafka-web-ui              | provectuslabs/kafka-ui:latest | 10001 |                            | ✓     | ✓       | kafka      |
| nacos                     | nacos/nacos-server:v2.2.3-slim      | 8848  | nacos/nacos                | ✓     | ✓       | mysql      |
| xxljob                    | kuschzzp/xxl-job-aarch64:2.4.0      | 9056  | admin/123456               | X     | ✓       | mysql      |
