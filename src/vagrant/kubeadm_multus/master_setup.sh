#!/bin/bash

sudo kubeadm init --apiserver-advertise-address=10.96.0.10  --service-cidr=10.96.0.0/24 --pod-network-cidr=10.244.0.0/16 --token 8c5adc.1cec8dbf339093f0
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
echo "export KUBECONFIG=$HOME/admin.conf" >> $HOME/.bash_profile

kubectl apply -f http://git.io/weave-kube-1.6
kubectl apply -f http://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f /vagrant/multus/kube_cni_multus.yml
