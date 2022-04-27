FROM ubuntu:latest

ENV FILEBEAT_VERSION 8.1.3
ENV FILEBEAT_URL curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz

RUN apt-get update -y && apt-get install apache2 -y
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY index.html /var/www/html/

RUN apt-get install curl && ${FILEBEAT_URL} && tar xzvf filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz

COPY filebeat.yml /etc/filebeat/
CMD apachectl -D FOREGROUND
EXPOSE 80