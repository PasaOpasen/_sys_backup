
set -e

cd /srv

for item in $(ls -1)
do
    if [ ! -d "$item" ]
    then
        continue
    fi

    (
        cd "$item"

        if [ ! -d Ansible ]
        then
            continue
        fi

        if [ -e Ansible/venv ]
        then
            (
                cd Ansible
                rm -rf venv
                make venv
            )
        fi

        make reset
        make pull || make pull || make pull
    )

done
