kubectl create namespace prom
kubectl apply -f prom_depl.yaml -n prom
kubectl apply -f prom_config_map.yaml -n prom
kubectl apply -f kub-dashboard-sa.yaml
helm install dashboard kubernetes-dashboard/kubernetes-dashboard -n kubernetes-dashboard --create-namespace
kubectl create token admin-user  -n kubernetes-dashboard