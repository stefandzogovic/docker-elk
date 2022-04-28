# ELK-Docker

Run the latest version of the ELK (Elasticsearch, Logstash, Kibana, FileBeat) stack with Docker and Docker Compose.
Developed on: 
    Docker version 20.10.14, build a224086
    Docker Compose version v2.4.1

# How it Works

Docker compose consists of 6 containers. Cluster of 3 ElasticSearch nodes with storage persistence. 1 Kibana container, 1 LogStash container, 1 container that runs Apache Web Server and FileBeat.
FileBeat sends Apache's logs over to LogStash which are then forwarded to ES nodes.

Give Kibana a few seconds to initialize, then access the Kibana web UI by hitting
[http://localhost:5601](http://localhost:5601)

![alt text](http://davegarry.com/wp-content/uploads/2020/09/image-2.png)

Based on the official Docker images:

* [elasticsearch](https://www.docker.elastic.co/r/elasticsearch/elasticsearch:8.1.3)
* [logstash](https://www.docker.elastic.co/r/logstash/logstash:8.1.3)
* [kibana](https://www.docker.elastic.co/r/kibana/kibana:8.1.3)

Using custom Docker image as well: 
* docker-elk_filebeat built on [ubuntu:latest](https://hub.docker.com/layers/ubuntu/library/ubuntu/latest/images/sha256-c27987afd3fd8234bcf7a81e46cf86c2c4c10ef06e80f0869c22c6ff22b29f9d?context=explore)


# How to setup 

1. Clone this repository
2. Start the ELK stack using `docker-compose`:
```console
$ docker-compose up
```
# OR
You can also choose to run it in background (detached mode):
```console
$ docker-compose up -d
```
<!-- 3. Test using sample log files 
```console
wget https://download.elastic.co/demos/kibana/gettingstarted/logs.jsonl.gz
gunzip logs.jsonl.gz
cat logs.jsonl | nc localhost 5000 -->
```

By default, the stack exposes the following ports:
* 5000: Logstash TCP input.
* 9200: Elasticsearch HTTP
* 1234: Apache2
* 5044: FileBeat output, Logstash TCP input
* 5601: Kibana Port