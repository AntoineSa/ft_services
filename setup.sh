#sudo usermod -aG docker $USER && newgrp docker;
minikube delete
minikube start --driver=docker;

eval $(minikube docker-env);

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml;
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml;
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)";

kubectl apply -f srcs/metallb/config.yaml;

docker build -t my_nginx ./srcs/nginx --build-arg M_IP=$(minikube ip);
docker build -t my_wp ./srcs/wordpress;
docker build -t my_mysql ./srcs/mysql;
docker build -t my_phpmyadmin ./srcs/phpmyadmin;
#docker build -t my_ftps ./srcs/ftps;
#docker build -t my_grafana ./srcs/grafana;
#docker build -t my_influxdb ./srcs/influxdb;

kubectl apply -f srcs/nginx/deployment.yaml;
kubectl apply -f srcs/wordpress/deployment.yaml;
kubectl apply -f srcs/mysql/deployment.yaml;
kubectl apply -f srcs/phpmyadmin/deployment.yaml;

minikube addons enable dashboard
minikube addons enable ingress
minikube addons enable metrics-server

minikube dashboard
