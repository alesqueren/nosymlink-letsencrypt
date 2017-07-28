#!/bin/bash
set -e

cd /etc/letsencrypt/

rm -rf /tmp/letsencrypt
mkdir -p /tmp/letsencrypt
mv archive live renewal /tmp/letsencrypt || true

for domain in $(ls /etc/letsencrypt/nginx);
do
    certbot certonly --webroot -w /webroot -d $domain
done

mv nginx /tmp/letsencrypt
cp -rL /etc/letsencrypt/{live,nginx}

echo "done" 
