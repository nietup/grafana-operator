#! /bin/bash
set -e

ACTION="$1"

if [[ "$ACTION" == "go" ]]; then
    echo "Using existing minikube..."
else
    echo "Recreating cluster..."
    minikube delete
    minikube start
fi

kubectl create namespace grafana-operator
helm3 repo add grafana https://grafana.github.io/helm-charts
helm3 repo update
helm3 install grafana-operator grafana/grafana-operator \
  --namespace grafana-operator \
  --set rbac.create=true
kubectl apply -f grafana.yaml
kubectl apply -f datasource.yaml

