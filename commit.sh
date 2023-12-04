#
# commits existing changes
#

status="$(git status -s)"

if [ -n "$status" ]
then
    echo "$status"
    git add .
    git commit -m "$(date +"%Y-%m-%d-%H-%M-%S")"
    git push 
else
    echo "nothing to commit in repo"
fi
