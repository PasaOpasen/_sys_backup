#
# adds system scan cron job to crond
#

set -e

file=/etc/cron.d/sys-backup

cat <<END | sudo tee $file
SHELL=/bin/bash
MAILTO=""

* * * * * su pasa -c cd $PWD && ./cron-script.sh >> /var/log/sys-backup.log
END

sudo chmod 644 $file
sudo crontab $file
