# Data.be ElasticSearch Utils

The purpose of this script is being able to create, restore or delete snapshots everywhere with the right bash version.

## How to use it

Examples are displayed with all options (`--`), they all are optional and will use the values in `default-config.sh` if not specified

### Snapshots: to create a snapshot

```bash
docker run ghcr.io/data-be/es-utils.sh/esutils:vVERSION_NUMBER create --endpoint=http://localhost:9200
--repository='my_backup_repository'
--snapshot-prefix='my_snapshot_prefix'
--snapshot-date='20191203' --index-date='20191203'
--indices='index1 index2 index3'
```

### Snapshots: to restore a snaphsot

```bash
docker run ghcr.io/data-be/es-utils.sh/esutils:vVERSION_NUMBER restore --endpoint=http://localhost:9200
--repository='my_backup_repository'
--snapshot-prefix='my_snapshot_prefix'
--snapshot-date='20191203' --index-date='20191203'
--indices='index1 index2 index3'
```

### Snapshots: to delete a snaphsot

You will have to validate when running delete, then it is mandatory to run it with `-ti` argument

```bash
docker run -ti ghcr.io/data-be/es-utils.sh/esutils:vVERSION_NUMBER delete --endpoint=http://localhost:9200
--repository='my_backup_repository'
--snapshot-prefix='my_snapshot_prefix'
--snapshot-date='20191203'
```

### Aliases: reassign aliases to indices

You will have to validate when running delete, then it is mandatory to run it with `-ti` argument

```bash
docker run -ti ghcr.io/data-be/es-utils.sh/esutils:vVERSION_NUMBER aliasesReassign --endpoint=http://localhost:9200
--aliases='alias1:index1 alias2:index2'
```
