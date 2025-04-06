#!/bin/bash

#expose gitlab port 
kubectl port-forward -n gitlab svc/gitlab-webservice-default 8080:8181