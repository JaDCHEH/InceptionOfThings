#!/bin/bash

echo "Updating system..."
sudo apt-get update -y

echo "[+] Installing net-tools"
sudo apt-get install -y net-tools
sudo ln -s /sbin/ifconfig /usr/local/bin/ifconfig

sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.111/24 dev eth1 && sudo ip link set eth1 up

echo "Installing K3s (server mode)..."
curl -sfL https://get.k3s.io | sh -

echo "Waiting for K3s to be ready..."
sleep 20

sudo ln -sf /usr/local/bin/k3s /usr/local/bin/kubectl

cd /home/vagrant/apps

echo "Deploying Kubernetes manifests from /home/vagrant/apps..."

sudo kubectl apply -f app1.yaml
sudo kubectl apply -f app2.yaml
sudo kubectl apply -f app3.yaml
sudo kubectl apply -f ingress.yaml

echo "Deployment complete! Apps should be accessible via:"
echo " - http://app1.com"
echo " - http://app2.com"
echo " - Anything else goes to app3 (default)"
