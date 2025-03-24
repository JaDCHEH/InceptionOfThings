#!/bin/bash

# Get the list of nodes in the cluster
kubectl get nodes -o wide

#
kubectl get all -n argocd

# Retrieve the initial admin password for Argo CD and save it to password.txt
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d > ./argocd-password