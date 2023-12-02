#
# activates venv with some additions
#

function ap {
    # wrapper under ansible-playbook with some automatic params control
    
    f=password.txt
    if [ -f $f ]
    then
        cmd="--become-password-file $f"
    else
        cmd="--ask-become-pass"
    fi 

    ansible-playbook  "$@" $cmd
}

export -f ap

source venv/bin/activate

