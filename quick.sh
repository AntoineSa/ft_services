if [ $1 -eq '1' ]
then
kubectl delete deployment mysql-deployment
kubectl delete service mysql-service
docker build -t my_mysql srcs/mysql
kubectl apply -f srcs/mysql/deployment.yaml
elif [ $1 -eq 2 ]
then
kubectl delete deployment wp-deployment
kubectl delete service wp-service
docker build -t my_wp srcs/wordpress
kubectl apply -f srcs/wordpress/deployment.yaml
elif [ $1 -eq 3 ]
then
kubectl delete deployment phpmyadmin-deployment
kubectl delete service phpmyadmin-service
docker build -t my_phpmyadmin srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/deployment.yaml
elif [ $1 -eq 4 ]
then
kubectl delete deployment nginx-deployment
kubectl delete service nginx-service
docker build -t my_nginx srcs/nginx
kubectl apply -f srcs/nginx/deployment.yaml
fi
