#!/bin/bash

# Delete all pods
kubectl delete pods --all -n argocd
kubectl delete pods --all -n dev

# Delete all services
kubectl delete svc --all -n argocd
kubectl delete svc --all -n dev

# Delete all deployments
kubectl delete deployments --all -n argocd
kubectl delete deployments --all -n dev

# Remove password file
rm -rf password.txt

# Delete namespaces
kubectl delete namespace argocd
kubectl delete namespace dev

# Delete the cluster
echo "Deleting the cluster"
k3d cluster delete iot-cluster