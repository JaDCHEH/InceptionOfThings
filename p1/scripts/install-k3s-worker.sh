#!/bin/bash

echo "[+] Waiting for server to be ready..."
sleep 15

echo "Updating system..."
sudo apt-get update -y

echo "[+] Installing net-tools"
sudo apt-get install -y net-tools
sudo ln -s /sbin/ifconfig /usr/local/bin/ifconfig

sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.111/24 dev eth1 && sudo ip link set eth1 up

echo "[+] Fetching token from server using scp..."
scp -o StrictHostKeyChecking=no root@kmoutaouS:/var/lib/rancher/k3s/server/node-token /tmp/token

if [ ! -s /tmp/token ]; then
  echo "Failed to fetch token from server. Exiting."
  exit 1
fi

export INSTALL_K3S_EXEC="agent --server https://kmoutaouS:6443 --token-file /tmp/token --node-ip=192.168.56.111 --flannel-iface=eth1"
curl -sfL https://get.k3s.io | sh -

echo "[+] K3s Agent installed."
