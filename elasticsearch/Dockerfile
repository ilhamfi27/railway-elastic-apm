FROM docker.elastic.co/elasticsearch/elasticsearch:8.18.0
USER root
RUN apt-get update && apt-get install -y gosu && rm -rf /var/lib/apt/lists/*
COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY --chmod=755 entrypoint.sh /entrypoint.sh
RUN chown elasticsearch:elasticsearch /usr/share/elasticsearch/config/elasticsearch.yml
ENTRYPOINT ["/entrypoint.sh"]
