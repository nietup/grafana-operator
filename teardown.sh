#! /bin/bash

minikube delete
helm repo remove grafana
helm repo update

