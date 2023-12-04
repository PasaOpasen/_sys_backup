#!/bin/bash
#
# script to restore main system 
#

set -e

if [ -f password.txt ] && $(cat password.txt | sudo -S -v &> /dev/null)
then
    echo "Found password file"
    passwd="$(cat password.txt)"
else
    read -s -p 'Write current sudo password: ' passwd

    echo $passwd | sudo -S -v && echo "OK"

    # save password for ansible
    echo -n $passwd > password.txt

fi

echo $passwd | sudo -S dnf install -y openssh git python3 python3-pip make

if [ "$(git config --get remote.origin.url)" == 'git@github.com:PasaOpasen/_sys_backup.git' ]
then 
    echo "Found exising repository, update..."
    git pull

else

    ssh-keygen || true

    read -n 1 -p 'Copy ssh keys to GitHub MANUALLY and press any key...'

    repo_path=~/sys-backup

    read -p "Write path to backup repo (${repo_path}): " rp

    if [ -n "$rp" ]
    then
        repo_path=$rp
    fi

    git clone git@github.com:PasaOpasen/_sys_backup.git ${repo_path}

    cd ${repo_path}

fi

make extract

make venv

source venv.sh
ap playbooks/packages.yml 
ap playbooks/other.yml 




