# Data.be ElasticSearch Utils

The purpose of this script is being able to create, restore or delete snapshots everywhere with the right bash version.

## How to use it

Examples are displayed with all options (`--`), they all are optional and will use the values in `default-config.sh` if not specified

### to create a snapshot

```bash
docker run databe/es-utils create --endpoint=http://localhost:9200
--repository='my_backup_repository'
--snapshot-date='20191203' --index-date='20191203'
--indices='index1 index2 index3'
```

### to restore a snaphsot

```bash
docker run databe/es-utils restore --endpoint=http://localhost:9200
--repository='my_backup_repository'
--snapshot-date='20191203' --index-date='20191203'
--indices='index1 index2 index3'
```

### to delete a snaphsot

You will have to validate when running delete, then it is mandatory to run it with `-ti` argument

```bash
docker run -ti databe/es-utils delete --endpoint=http://localhost:9200
--repository='my_backup_repository'
--snapshot-date='20191203'
```
