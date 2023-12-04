#
# commits existing changes
#

if [ -n "$(git status -s)" ]
then
    git status 
    git add .
    git commit -m "$(date +"%Y-%m-%d-%H-%M-%S")"
    git push 
else
    echo "nothing to commit in repo"
fi
