#
# moves files from this repo storage to the system
#
# usage:
#   bash extract.sh /

src=storage
target=${1:-/}

mkdir -p $target

echo "Perform copying from $(realpath $src) to $(realpath $target) ..."

cd $src
find . -type f | xargs -I@ bash -c "cp --update --parents -v @ $target"

