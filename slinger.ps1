#minikube start
kubectl apply -f .\webservice.yml --record
kubectl get all
minikube ip
helm init
Start-Sleep 10
$REDIS_PASSWORD="secretpassword"
helm install stable/redis --set password=$REDIS_PASSWORD --name assessmentredis -f RedisConfig.yml
kubectl run --namespace default assessmentredis-client --rm --tty -i --restart='Never' --env REDIS_PASSWORD=$REDIS_PASSWORD --image docker.io/bitnami/redis:5.0.5-debian-9-r36 -- bash