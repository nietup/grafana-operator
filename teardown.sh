#! /bin/bash

minikube delete
helm3 repo remove grafana
helm3 repo update

