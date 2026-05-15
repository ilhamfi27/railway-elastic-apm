FROM docker.elastic.co/kibana/kibana:8.18.0
USER root
COPY kibana.yml /usr/share/kibana/config/kibana.yml
COPY --chmod=755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
