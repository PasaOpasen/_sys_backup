#!/bin/bash
#
# script to restore main system 
#

set -e

read -s -p 'Write current sudo password: ' passwd

echo $passwd | sudo -S -v && echo "OK"

echo $passwd | sudo -S dnf install -y openssh git python3 python3-pip make

ssh-keygen 

read -n 1 -p 'Copy ssh keys to GitHub MANUALLY and press any key...'

repo_path=~/sys-backup

read -p "Write path to backup repo (${repo_path}): " rp

if [ -n "$rp" ]
then
    repo_path=$rp
fi

git clone https://github.com/PasaOpasen/_sys_backup ${repo_path}

cd ${repo_path}

# save password for ansible
echo $passwd > password.txt

make venv





