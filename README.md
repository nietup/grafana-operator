# Step-by-step Setup

## Cluster Clearup and Setup

```
minikube delete && minikube start
kubectl create namespace argocd
```

## ArgoCD Setup

```
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo/argo-cd --namespace argocd
kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
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
kubectl port-forward svc/grafana-service -n grafana-operator 3000:3000
```

## Remove Everything

```
minikube delete
helm repo remove argo grafana
helm repo update
```


---------------------------------------------------------------------------------------------------


# Useful commands

```
kubectl config set-context --current --namespace=<namespace_name>
kubectl config view --minify
kubectl get pod
kubectl get namespace
```

