#!/bin/bash
echo "[+] Installing K3s Server..."

echo "Updating system..."
sudo apt-get update -y

echo "[+] Installing net-tools..."
sudo apt-get install -y net-tools
sudo ln -s /sbin/ifconfig /usr/local/bin/ifconfig

sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.110/24 dev eth1 && sudo ip link set eth1 up

NODE_IP=192.168.56.110
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-ip=${NODE_IP} --bind-address=${NODE_IP} --flannel-iface=eth1" sh -

echo "[+] K3s Server installed."

