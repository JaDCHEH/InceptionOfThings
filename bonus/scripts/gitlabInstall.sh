#!/bin/sh

helm repo add gitlab https://charts.gitlab.io/

helm repo update

helm install gitlab gitlab/gitlab --namespace gitlab -f ./confs/helmConfig.yaml
