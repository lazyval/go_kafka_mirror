package main

import kafka "github.com/stealthly/go_kafka_client"

//TODO looks like it makes sense to make this like following: go run switch.go --whitelist="test*" --zookeeper 192.168.86.5:2181 --group group1
func main() {
	topics := kafka.DeployedTopics{"test.*", "white_list"}

	zkConfig := kafka.NewZookeeperConfig()
	zkConfig.ZookeeperConnect = []string{"192.168.86.5:2181"}

	zk := kafka.NewZookeeperCoordinator(zkConfig)
	zk.Connect()
	zk.DeployTopics("group1", topics)
}
