#!/bin/bash

ROUTER_CONTAINER_ID=$(docker ps -q -f name=router)
CONFIG_CONTAINER_ID=$(docker ps -q -f name=config)
SHARD_1_CONTAINER_ID=$(docker ps -q -f name=shard1)
SHARD_2_CONTAINER_ID=$(docker ps -q -f name=shard2)
SHARD_3_CONTAINER_ID=$(docker ps -q -f name=shard3)

docker exec $CONFIG_CONTAINER_ID sh -c "mongosh --port 27017 < /scripts/init-config.js"
docker exec $SHARD_1_CONTAINER_ID sh -c "mongosh --port 27018 < /scripts/init-shard1.js"
docker exec $SHARD_2_CONTAINER_ID sh -c "mongosh --port 27019 < /scripts/init-shard2.js"
docker exec $SHARD_3_CONTAINER_ID sh -c "mongosh --port 27020 < /scripts/init-shard3.js"
docker exec $ROUTER_CONTAINER_ID sh -c "mongosh < /scripts/init-router.js"