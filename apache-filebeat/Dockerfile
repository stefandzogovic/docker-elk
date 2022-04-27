FROM ubuntu:latest

ENV FILEBEAT_VERSION 8.1.3
ENV FILEBEAT_URL wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-amd64.deb


RUN apt-get update -y && apt-get install apache2 -y
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY index.html /var/www/html/

RUN apt-get install wget && ${FILEBEAT_URL} && dpkg -i filebeat-${FILEBEAT_VERSION}-amd64.deb
RUN rm filebeat-${FILEBEAT_VERSION}-amd64.deb

RUN service filebeat start

COPY filebeat.yml /etc/filebeat/
CMD apachectl -D FOREGROUND
EXPOSE 80