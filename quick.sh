kubectl delete deployment mysql-deployment
kubectl delete service mysql-service
docker build -t my_mysql srcs/mysql
kubectl apply -f srcs/mysql/deployment.yaml
kubectl apply -f srcs/mysql/service.yaml   

#kubectl delete deployment wp-deployment
#kubectl delete service wp-service
#docker build -t my_wp srcs/wordpress
#kubectl apply -f srcs/wordpress/deployment.yaml
#kubectl apply -f srcs/wordpress/service.yaml   

#kubectl delete deployment phpmyadmin-deployment
#kubectl delete service phpmyadmin-service
#docker build -t my_phpmyadmin srcs/phpmyadmin
#kubectl apply -f srcs/phpmyadmin/deployment.yaml
#kubectl apply -f srcs/phpmyadmin/service.yaml   
