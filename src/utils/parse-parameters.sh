source ./default-config.sh

for i in "${@:2}"
do
case $i in
    -e=*|--endpoint=*)
    INPUT_ENDPOINT="${i#*=}"
    shift
    ;;
    -sd=*|--snapshot-date=*)
    INPUT_SNAPSHOT_DATE="${i#*=}"
    shift
    ;;
    -id=*|--index-date=*)
    INPUT_INDEX_DATE="${i#*=}"
    shift
    ;;
    -i=*|--indices=*)
    INPUT_INDICES="${i#*=}"
    shift
    ;;
    -r=*|--repository=*)
    INPUT_REPOSITORY="${i#*=}"
    shift
    ;;
    --default)
    DEFAULT=YES
    shift
    ;;
    *)
      echo "${i} is not a valid option"
      echo "Remember that we use a key=value notation"
      exit 1
    ;;
esac
done

today=`date +%Y%m%d`

ENDPOINT=${INPUT_ENDPOINT:-$DEFAULT_ENDPOINT}
SNAPSHOT_DATE=${INPUT_SNAPSHOT_DATE:-$DEFAULT_SNAPSHOT_DATE}
INDEX_DATE=${INPUT_INDEX_DATE:-$DEFAULT_INDEX_DATE}
REPOSITORY=${INPUT_REPOSITORY:-$DEFAULT_REPOSITORY}

if [ "$INPUT_INDICES" != "" ]; then
  INDICES=""
  INDICES=($INPUT_INDICES)
else
  INDICES=($DEFAULT_INDICES)
fi
