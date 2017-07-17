#! /bin/bash

#安装软件
yum install -y yum-utils device-mapper-persistent-data lvm2
#yum repo
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

##阿里云镜像
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://cr881kje.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker