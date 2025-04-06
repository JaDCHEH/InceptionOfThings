#!/bin/bash

echo "[+] Waiting for server to be ready..."
sleep 15

echo "[+] Fetching token from server using scp..."
scp -o StrictHostKeyChecking=no root@kmoutaouS:/var/lib/rancher/k3s/server/node-token /tmp/token

if [ ! -s /tmp/token ]; then
  echo "Failed to fetch token from server. Exiting."
  exit 1
fi

export INSTALL_K3S_EXEC="agent --server https://kmoutaouS:6443 --token-file /tmp/token --node-ip=192.168.56.111"
curl -sfL https://get.k3s.io | sh -

echo "[+] K3s Agent installed."
