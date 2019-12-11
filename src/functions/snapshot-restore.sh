function snapshotRestore() {
  ENDPOINT=$1
  REPOSITORY=$2
  SNAPSHOT_DATE=$3
  INDEX_DATE=$4
  INDICES=$5

  indicesCommand=''

  for index in "${INDICES[@]}"
  do
    indicesCommand+="${index}_${INDEX_DATE},"
  done

  payload='{
    "indices": "'${indicesCommand%?}'",
    "ignore_unavailable": true,
    "include_global_state": false
  }'

  echo "Snapshot (snapshot_${SNAPSHOT_DATE}) is starting for the indices: ${indicesCommand%?}"

  curl -X POST "${ENDPOINT}/_snapshot/${REPOSITORY}/snapshot_${SNAPSHOT_DATE}/_restore?wait_for_completion=true&pretty" -H 'Content-Type: application/json' -d "${payload}"
}
