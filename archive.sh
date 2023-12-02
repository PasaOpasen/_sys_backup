
#
# moves necessary system files to this repo
#

target=storage

mkdir -p $target

echo "Perform copying..."
cat cp-list.txt | grep -v -E '^#' | xargs -I@ bash -c "cp --archive --update --parents -v @ $target"


