#! /bin/bash

kubectl port-forward svc/grafana-service -n grafana-operator 3000:3000 &

