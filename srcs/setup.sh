#sudo usermod -aG docker $USER && newgrp docker;
minikube start --driver=docker;
minikube addons enable ingress;

eval $(minikube docker-env);

docker build -t nginx ./srcs/nginx;
docker build -t wp ./srcs/wordpress;
#docker build -t mysql ./srcs/mysql;

kubectl apply -f srcs/nginx/deployment.yaml;
kubectl apply -f srcs/nginx/service.yaml;
echo "Waiting for ingress-controller setup (max : 180s)";
kubectl wait --namespace kube-system --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=180s;
kubectl apply -f srcs/ingress/ingress.yaml;
minikube dashboard &
