#!/bin/bash
#Create kubernetes cluster with k3d

k3d cluster create iot-cluster -p "8888:8888@loadbalancer"

#Create namespaces
kubectl create namespace argocd
kubectl create namespace dev

#Deploy argo CD

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl wait --for=condition=Ready pods --all -n argocd
#Retrieve argocd initial admin password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d> ./password.txt
#Forward port to access argo CD
kubectl apply -f ../Config/application.yaml

kubectl port-forward svc/argocd-server -n argocd 8080:443
