#!/bin/bash

source ./utils/databe-logo.sh

source ./functions/snapshot-create.sh
source ./functions/snapshot-restore.sh
source ./functions/snapshot-delete.sh

source ./functions/aliases-reassign.sh

COMMAND=$1

source ./utils/parse-parameters.sh

case "$COMMAND" in
  create)
    snapshotCreate ${ENDPOINT} ${REPOSITORY} ${SNAPSHOT_PREFIX} ${SNAPSHOT_DATE} ${INDEX_DATE} ${INDICES}
    ;;

  restore)
    snapshotRestore ${ENDPOINT} ${REPOSITORY} ${SNAPSHOT_PREFIX} ${SNAPSHOT_DATE} ${INDEX_DATE} ${INDICES}
    ;;

  delete)
    snapshotDelete ${ENDPOINT} ${REPOSITORY} ${SNAPSHOT_PREFIX} ${SNAPSHOT_DATE}
    ;;

  aliasesReassign)
    aliasesReassign ${ENDPOINT} ${ALIASES}
    ;;

  *)
    echo "Err: $COMMAND is a wrong command!"
    echo "Usage: $0 {create, restore, delete}"
    exit 1
esac


