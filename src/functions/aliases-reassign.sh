function aliasesReassign() {
  ENDPOINT=$1
  ALIASES=$2

  if [ "$ALIASES" == "" ]; then
    echo "You have to provide a aliases mapping like this (--aliases='alias1:index1 alias2:index2')"
    exit 1
  fi

  echo '=== Getting already assigned aliases ==='

  for alias in "${ALIASES[@]}"
  do
    aliasInRun=$(echo $alias | cut -d ':' -f 1)

    aliasesTemp=$(curl --silent -X GET "${ENDPOINT}/_cat/aliases" | grep ${aliasInRun} | tr -s ' ' | cut -d ' ' -f 2)

    aliasesTemp=("${aliasesTemp}")

    for aliasTemp in $aliasesTemp
    do
      ALREAY_ASSIGNED_ALIASES+="${aliasInRun}:${aliasTemp} "
    done
  done

  echo '=== Removing already assigned aliases ==='

  ALREAY_ASSIGNED_ALIASES=("${ALREAY_ASSIGNED_ALIASES}")

  for alreadyAssignedAlias in $ALREAY_ASSIGNED_ALIASES
  do
    aliasInRun=$(echo $alreadyAssignedAlias | cut -d ':' -f 1)
    indexInRun=$(echo $alreadyAssignedAlias | cut -d ':' -f 2)

    echo "Removing: ${alreadyAssignedAlias}"
    curl -X DELETE "${ENDPOINT}/${indexInRun}/_alias/${aliasInRun}"
    echo ""
  done

  echo '=== Assigning new indexes to aliases ==='

  for alias in "${ALIASES[@]}"
  do
    aliasInRun=$(echo $alias | cut -d ':' -f 1)
    indexInRun=$(echo $alias | cut -d ':' -f 2)

    payload='{
      "actions": [
          {
            "add": {
              "index": "'${indexInRun}'",
              "alias": "'${aliasInRun}'"
            }
          }
        ]
    }'

    echo "Assigning: ${alias}"
    curl -X POST "${ENDPOINT}/_aliases" -H 'Content-Type: application/json' -d "${payload}"
    echo ""
  done
}
