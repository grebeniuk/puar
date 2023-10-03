# helm inspect values hashicorp/consul
# kubectl port-forward -n consul consul-server-0 8500
# kubectl get pods -n consul
# kubectl port-forward -n consul $(kubectl get pods --selector app=go-app-exporter -n consul -o custom-columns=":metadata.name") 8000
helm repo add hashicorp https://helm.releases.hashicorp.com
helm install consul hashicorp/consul --set global.name=consul --create-namespace --namespace consul  --values values.yaml
docker build -t agre/go-app-exporter .
kind load docker-image agre/go-app-exporter:latest
kubectl apply -f ./deployment.yaml