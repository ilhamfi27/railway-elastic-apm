#!/bin/bash
set -e

# Start Elasticsearch in the background
/usr/local/bin/docker-entrypoint.sh elasticsearch &
ES_PID=$!

# Wait for Elasticsearch to be ready
echo "Waiting for Elasticsearch to start..."
until curl -s -u "elastic:${ELASTIC_PASSWORD}" "http://localhost:9200/_cluster/health" | grep -q '"status"'; do
  sleep 5
done

echo "Setting kibana_system password..."
curl -s -X POST -u "elastic:${ELASTIC_PASSWORD}" \
  "http://localhost:9200/_security/user/kibana_system/_password" \
  -H "Content-Type: application/json" \
  -d "{\"password\": \"${KIBANA_PASSWORD}\"}"

echo "kibana_system password set."

# Wait for Elasticsearch process to exit
wait $ES_PID
