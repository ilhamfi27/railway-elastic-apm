#!/bin/bash
set -e

echo "Waiting for Elasticsearch at ${ELASTICSEARCH_HOSTS}..."
until curl -sf -u "elastic:${ELASTIC_PASSWORD}" "${ELASTICSEARCH_HOSTS}/_cluster/health" | grep -q '"status"'; do
  echo "Elasticsearch not ready, retrying in 5s..."
  sleep 5
done

echo "Elasticsearch is ready. Starting Logstash..."
exec /usr/local/bin/docker-entrypoint "$@"
