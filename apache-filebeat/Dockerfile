FROM ubuntu:latest

ENV FILEBEAT_VERSION 8.1.3
ENV FILEBEAT_URL wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-arm64.deb


RUN apt-get update -y && apt-get install apache2 -y
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

WORKDIR /var/www/html
COPY index.html index.html

RUN apt-get install wget && ${FILEBEAT_URL} && dpkg -i filebeat-${FILEBEAT_VERSION}-arm64.deb
RUN rm filebeat-${FILEBEAT_VERSION}-arm64.deb

COPY filebeat.yml /etc/filebeat/
# RUN apt install systemctl -y && systemctl enable filebeat && systemctl daemon-reload && systemctl start filebeat
ADD docker-entrypoint.sh    /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
EXPOSE 80