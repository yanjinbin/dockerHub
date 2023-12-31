#!/bin/bash
set -e

# Read YAML file
yaml_file='topics.yaml'
topics=$(grep "topic:" "$yaml_file" | awk '{print $2}')

# Loop through topics and create them using curl
for topic in $topics; do
  curl 'http://localhost:10001/api/clusters/My%20Kafka%20Cluster/topics' \
    -H 'Accept: */*' \
    -H 'Accept-Language: zh-CN,zh;q=0.9' \
    -H 'Connection: keep-alive' \
    -H 'Content-Type: application/json' \
    -H 'DNT: 1' \
    -H 'Origin: http://localhost:10001' \
    -H 'Sec-Fetch-Dest: empty' \
    -H 'Sec-Fetch-Mode: cors' \
    -H 'Sec-Fetch-Site: same-origin' \
    -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36' \
    -H 'sec-ch-ua: "Google Chrome";v="117", "Not;A=Brand";v="8", "Chromium";v="117"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "macOS"' \
    --data-raw "{\"name\":\"$topic\",\"partitions\":3,\"replicationFactor\":\"1\",\"configs\":{\"cleanup.policy\":\"delete\",\"retention.ms\":\"2419200000\",\"retention.bytes\":\"-1\",\"min.insync.replicas\":\"3\"}}" \
    --compressed
    # 执行你的循环操作
    # 如果循环操作失败，则会立即退出脚本
    # 在这里添加你的命令
    if [ "$?" -ne 0 ]; then
      echo "循环操作失败！退出脚本。"
      exit 1
    fi
done

echo "循环正常完成！"