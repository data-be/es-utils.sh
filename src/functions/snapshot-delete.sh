function snapshotDelete() {
  ENDPOINT=$1
  REPOSITORY=$2
  SNAPSHOT_PREFIX=$3
  SNAPSHOT_DATE=$4

  echo "You are about to delete: snapshot_${SNAPSHOT_DATE}"

  read -r -p "Are you sure? [y/N] " response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    echo "Snapshot (${SNAPSHOT_PREFIX}_${SNAPSHOT_DATE}) is being deleted"

    curl -X DELETE "${ENDPOINT}/_snapshot/${REPOSITORY}/${SNAPSHOT_PREFIX}_${SNAPSHOT_DATE}?wait_for_completion=true&pretty"
  else
    exit 0
  fi
}
