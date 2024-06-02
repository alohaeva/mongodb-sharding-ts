#docker exec 6a07df26590c sh -c "mongosh --port 27017 < /scripts/init-config.js"
#docker exec a2955d3bc0e4 sh -c "mongosh --port 27018 < /scripts/init-shard1.js"
#docker exec 2553abd41f4e sh -c "mongosh --port 27019 < /scripts/init-shard2.js"
#docker exec a25cd274c677 sh -c "mongosh --port 27020 < /scripts/init-shard3.js"
#docker exec c56bbe8d9d18 sh -c "mongosh < /scripts/init-router.js"
docker exec -it c56bbe8d9d18 mongosh