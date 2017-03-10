#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# purge systemd
echo 'Yes, do as I say!' | apt purge -y --force-yes systemd init

apt update && apt install --no-install-recommends -y ca-certificates cron curl

echo "downloading https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64"

curl -L https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64 > /tini
chmod +x /tini

# init script
cat <<IOP > /croninit.sh
#!/bin/bash 

/usr/bin/env > /etc/environment
exec /usr/sbin/cron -f

IOP
chmod +x /croninit.sh

# clean cron
rm -rf /etc/cron.*
echo '# m h dom mon dow user	command' > /etc/crontab

# clean apt
apt-get clean