### kubectl apply commands in order
    
    kubectl apply -f mongo-secret.yaml
    kubectl apply -f mongo-configmap.yaml 
    kubectl apply -f mongo.yaml
    kubectl apply -f mongo-express.yaml

### kubectl get commands

    kubectl get pod
    kubectl get pod --watch
    kubectl get pod -o wide
    kubectl get service
    kubectl get secret
    kubectl get all | grep mongodb

### kubectl debugging commands

    kubectl describe pod mongodb-deployment-xxxxxx
    kubectl describe service mongodb-service
    kubectl logs mongo-express-xxxxxx

### give a URL to external service in k8s

k8s do support default LoadBalancer, To do so we need to use MetaLlb to get External-IP address.
Alternatively, we can use NodePort and blow commands for minikube to access.

    minikube service mongo-express-service
    
    
    **Alternatively: Access Mongo-Express Through NodePort:-
    - Direct Access Service k8s pod, through nodePort:30000- http://172.16.0.201:30000/
    - Vagrant expose this port at 30001:- http://localhost:13000/



