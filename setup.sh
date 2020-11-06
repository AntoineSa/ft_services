#sudo usermod -aG docker $USER && newgrp docker;
minikube delete
minikube start --driver=docker;

eval $(minikube docker-env);

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml;
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml;
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)";

kubectl apply -f srcs/metallb/config.yaml;

i=0
docker build -t my_nginx ./srcs/nginx --build-arg M_IP=$(minikube ip)
while [ "$?" != 0 ] && [ $i -lt 5 ]
do
	i=$((i + 1))
	echo "\nfailed to build Nginx container image.\nRetry\n"
	docker build -t my_nginx ./srcs/nginx --build-arg M_IP=$(minikube ip)
done
i=0
echo "\n"
docker build -t my_wp ./srcs/wordpress;
while [ "$?" != 0 ] && [ $i -lt 5 ]
do
	i=$((i + 1))
	echo "\nfailed to build wordpress container image.\nRetry $i of 5\n"
	docker build -t my_wp ./srcs/wordpress;
done
i=0
echo "\n"
docker build -t my_mysql ./srcs/mysql;
while [ "$?" != 0 ] && [ $i -lt 5 ] 
do
	i=$((i + 1))
	echo "\nfailed to build mysql container image.\nRetry $i of 5\n"
	docker build -t my_mysql ./srcs/mysql;
done
i=0
echo "\n"
docker build -t my_phpmyadmin ./srcs/phpmyadmin;
while [ "$?" != 0 ] && [ $i -lt 5 ]
do
	i=$((i + 1))
	echo "\nfailed to build phpMyAdmin container image.\nRetry $i of 5\n"
	docker build -t my_phpmyadmin ./srcs/phpmyadmin;
done
echo "\n"
docker build -t my_ftps ./srcs/ftps --build-arg M_IP=$(minikube ip);
while [ "$?" != 0 ] && [ $i -lt 5 ]
do
	i=$((i + 1))
	echo "\nfailed to build ftps container image.\nRetry $i of 5\n"
	docker build -t my_ftps ./srcs/ftps --build-arg M_IP=$(minikube ip);
done
echo "\n"
docker build -t my_grafana ./srcs/grafana;
while [ "$?" != 0 ] && [ $i -lt 5 ]
do
	i=$((i + 1))
	echo "\nfailed to build grafana container image.\nRetry $i of 5\n"
	docker build -t my_grafana ./srcs/grafana;
done
echo "\n"
docker build -t my_influxdb ./srcs/influxdb;
while [ "$?" != 0 ] && [ $i -lt 5 ]
do
	i=$((i + 1))
	echo "\nfailed to build influxDB container image.\nRetry $i of 5\n"
	docker build -t my_influxdb ./srcs/influxdb;
done
echo "\n"

kubectl apply -f srcs/nginx/deployment.yaml;
kubectl apply -f srcs/wordpress/deployment.yaml;
kubectl apply -f srcs/mysql/deployment.yaml;
kubectl apply -f srcs/phpmyadmin/deployment.yaml;
kubectl apply -f srcs/ftps/deployment.yaml;
kubectl apply -f srcs/grafana/deployment.yaml;
kubectl apply -f srcs/influxdb/deployment.yaml;

minikube addons enable dashboard
minikube addons enable ingress
minikube addons enable metrics-server

minikube dashboard
