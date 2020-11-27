FROM docker.elastic.co/logstash/logstash-oss:6.5.1

RUN bin/logstash-plugin install --version 6.4.2 logstash-output-amazon_es

USER root

COPY config/logstash.yml config/logstash.yml
COPY pipeline/logstash.conf pipeline/logstash.conf
RUN chown --recursive logstash:logstash config/ pipeline/

USER logstash

EXPOSE 5044
