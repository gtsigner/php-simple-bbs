#! /bin/bash
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum-config-manager --enable docker-ce-edge
yum-config-manager --enable docker-ce-testing
yum-config-manager --disable docker-ce-edge
yum makecache fast
yum install docker-ce
yum list docker-ce.x86_64  --showduplicates | sort -r
yum install docker-ce-
systemctl start docker
systemctl enable docker
