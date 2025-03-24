#!/bin/bash

# Delete all pods
kubectl delete pods --all -n argocd
kubectl delete pods --all -n dev
kubectl delete pods --all -n gitlab
# Delete all services
kubectl delete svc --all -n argocd
kubectl delete svc --all -n dev
kubectl delete svc --all -n gitlab

# Delete all deployments
kubectl delete deployments --all -n argocd
kubectl delete deployments --all -n dev
kubectl delete deployments --all -n gitlab

# Remove password file
rm -rf argocd-password.txt gitlab-password
rm -rf argocd-password.txt argocd-password

# Delete namespaces
kubectl delete namespace argocd
kubectl delete namespace dev
kubectl delete namespace gitlab

# Delete the cluster
echo "Deleting the cluster"
k3d cluster delete bonus