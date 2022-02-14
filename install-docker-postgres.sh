#!/bin/bash
apt update
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
apt install docker-ce -y
docker run -d \
    --name my-postgres \
    --restart unless-stopped \
    -e POSTGRES_PASSWORD=P@ssw0rd \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /custom/mount:/var/lib/postgresql/data \
    postgres
