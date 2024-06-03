# MongoDB Sharding Example

[Sharding Data Set](./data/books.json)

## Steps

### Run docker-compose config

```shell
docker compose -f docker-compose.yml up -d --build
```

### Run set-up.sh script to set up infra for sharding

```shell
sh set-up.sh
```

### Shard collection in mongosh environment

```shell
docker exec -it <router-container-id> mongosh

# after connection to container

sh.enableSharding("test")

sh.shardCollection("test.books", { title : "hashed" } ) // sharding collection based on title property
```

### Import data into collection

```shell

docker-compose exec router mongoimport --db test --collection books --file books.json
```

