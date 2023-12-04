#
# commits existing changes
#

if [ -n "$(git status -s)" ]
then
    git add .
    git commit -m "$(date +"%Y-%m-%d-%H-%M-%S")"
    git push 
fi
