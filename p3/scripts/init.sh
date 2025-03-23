#!/bin/bash

# Create Kubernetes cluster with k3d
k3d cluster create iot-cluster -p "8888:8888@loadbalancer"

# Create namespaces for Argo CD and development
kubectl create namespace argocd
kubectl create namespace dev

# Deploy Argo CD in the argocd namespace
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for all Argo CD pods to be ready
kubectl wait --for=condition=Ready pods --all -n argocd

# Retrieve the initial admin password for Argo CD and save it to password.txt
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d > ./password.txt

# Apply the application configuration from the specified YAML file
kubectl apply -f ../Config/application.yaml

# Forward port 8080 to access the Argo CD server
kubectl port-forward svc/argocd-server -n argocd 8080:443