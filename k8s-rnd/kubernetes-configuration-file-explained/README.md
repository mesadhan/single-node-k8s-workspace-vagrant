### kubectl apply commands in order
    
    kubectl apply -f nginx-deployment.yaml
    kubectl apply -f nginx-service.yaml

### kubectl get commands

    kubectl get pod
    kubectl get pod --watch
    kubectl get pod -o wide
    kubectl get service
    kubectl get secret
    kubectl get all | grep nginx

### kubectl debugging commands

    kubectl describe pod nginx-deployment-xxxxxx
    kubectl describe service nginx-service
    kubectl logs nginx-deployment-xxxxxx

### give a URL to external service in k8s

    minikube service nginx-service