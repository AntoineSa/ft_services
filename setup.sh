#sudo usermod -aG docker $USER && newgrp docker;
minikube start --driver=docker;

eval $(minikube docker-env);

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml;
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml;
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)";

kubectl apply -f srcs/metallb/config.yaml;

docker build -t my_nginx ./srcs/nginx --build-arg M_IP=$(minikube ip);
docker build -t wp ./srcs/wordpress;
docker build -t mysql ./srcs/mysql;

kubectl apply -f srcs/nginx/deployment.yaml;
kubectl apply -f srcs/nginx/service.yaml;
kubectl apply -f srcs/wordpress/deployment.yaml;
kubectl apply -f srcs/wordpress/service.yaml;
kubectl apply -f srcs/mysql/deployment.yaml;
kubectl apply -f srcs/mysql/service.yaml;
minikube dashboard
