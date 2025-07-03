# **Grafana Operator: Automate Monitoring** 🚀

If you're using **Grafana** for monitoring and **K8s** for managing infrastructure, **Grafana Operator** will make Grafana management much easier


## 🔍 What is Grafana Operator?

It’s a Kubernetes extension (CRD) that lets you manage Grafana instances declaratively – like other resources in your cluster

You can define everything in YAML and manage it in git 🙌


## 🛠️ What can you control?

- 📊 **Dashboards** – create and update dashboards via code
- 🛢️ **Datasources** – define data sources
- 🔔 **Alerts** – manage alerts
- 🔌 **Plugins**, and more!


## 📂 What's in this Repository?

This repo provides a fully working local setup for deploying Grafana using the **Grafana Operator** in a **Minikube cluster**

### It includes:

- ⚙️ Example **Custom Resources**:
  - **Grafana** instance
  - **GrafanaDashboard**
  - **GrafanaDatasource**
- 🔁 Scripts to start and clean up the environment


---------------------------------------------------------------------------------------------------


# Step-by-step Setup

## Cluster Clearup and Setup

```
minikube delete && minikube start
```

## Grafana Operator Setup

```
kubectl create namespace grafana-operator
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install grafana-operator grafana/grafana-operator \
  --namespace grafana-operator \
  --set rbac.create=true
kubectl apply -f grafana.yaml
kubectl apply -f datasource.yaml
kubectl port-forward svc/grafana-service -n grafana-operator 3000:3000
```

## Remove Everything

```
minikube delete
helm repo remove argo grafana
helm repo update
```


---


# Useful commands

```
kubectl config set-context --current --namespace=<namespace_name>
kubectl config view --minify
kubectl get pod
kubectl get namespace
```

