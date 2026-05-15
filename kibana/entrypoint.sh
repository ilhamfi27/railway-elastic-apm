#!/bin/bash
set -e

echo "Waiting for Elasticsearch and kibana_system credentials..."
until curl -sf -u "kibana_system:${ELASTICSEARCH_PASSWORD}" "${ELASTICSEARCH_HOSTS}/_cluster/health" | grep -q '"status"'; do
  echo "Kibana_system not ready yet, retrying in 5s..."
  sleep 5
done

echo "Elasticsearch ready. Starting Kibana..."
exec /usr/share/kibana/bin/kibana --allow-root
