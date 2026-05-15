FROM docker.elastic.co/elasticsearch/elasticsearch:8.18.0
USER root
COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY --chmod=755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
