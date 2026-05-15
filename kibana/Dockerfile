FROM docker.elastic.co/kibana/kibana:8.18.0
USER root
COPY kibana.yml /usr/share/kibana/config/kibana.yml
CMD ["/usr/share/kibana/bin/kibana", "--allow-root"]
