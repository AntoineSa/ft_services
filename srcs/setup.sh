#sudo usermod -aG docker $USER && newgrp docker;
minikube start --driver=docker;
eval $(minikube docker-env);
docker build -t nginx ./srcs/nginx ;
kubectl apply -f srcs/nginx/deployment.yaml;
kubectl apply -f srcs/nginx/service.yaml;
kubectl apply -f srcs/ingress/ingress.yaml;
