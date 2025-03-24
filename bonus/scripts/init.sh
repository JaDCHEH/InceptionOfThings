#!/bin/bash

# Create Kubernetes cluster with k3d
k3d cluster create bonus -p "8888:8888@loadbalancer"

# Create namespaces for Argo CD and development
kubectl create namespace argocd
kubectl create namespace dev
kubectl create namespace gitlab

# Deploy Argo CD in the argocd namespace
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for all Argo CD pods to be ready
kubectl wait --for=condition=Ready pods --all -n argocd

# Patch the Argo CD service to use NodePort
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
