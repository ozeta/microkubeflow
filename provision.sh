#!/bin/bash
echo "Guest VM IP: ${1}"
apt-get update
apt-get install -y python3 python3-pip
#git
add-apt-repository ppa:git-core/ppa -y
apt-get update
apt-get install git -y

export USER=vagrant

snap install microk8s --classic
usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
# microk8s status --wait-ready
# microk8s enable kubeflow
