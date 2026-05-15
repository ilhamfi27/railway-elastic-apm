#!/bin/bash
set -e

# Fix volume permissions (Railway mounts volumes as root)
chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

# Set kibana_system password after ES starts
_setup_kibana_password() {
  echo "Waiting for Elasticsearch to start..."
  until curl -sf -u "elastic:${ELASTIC_PASSWORD}" "http://localhost:9200/_cluster/health" | grep -q '"status"'; do
    sleep 5
  done
  echo "Setting kibana_system password..."
  curl -sf -X POST -u "elastic:${ELASTIC_PASSWORD}" \
    "http://localhost:9200/_security/user/kibana_system/_password" \
    -H "Content-Type: application/json" \
    -d "{\"password\": \"${KIBANA_PASSWORD}\"}"
  echo "kibana_system password set."
}

_setup_kibana_password &

# Drop to elasticsearch user and start ES
exec gosu elasticsearch /usr/local/bin/docker-entrypoint.sh eswrapper
