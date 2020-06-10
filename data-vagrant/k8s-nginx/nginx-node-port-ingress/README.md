# Service Access Through NodePort

## 1. Now, apply configuration, deployment and service

    kubectl apply -f nginx-deployment.yaml
    kubectl apply -f nginx-service.yaml
    kubectl apply -f nginx-ingress.yaml

## 2. Check Service information

    kubectl get services -o wide
    kubectl get ingress

Output,

```bash
NAME            HOSTS              ADDRESS     PORTS   AGE
nginx-ingress   hello-world.info   127.0.0.1   80      14m
```

Open file and change host `sudo vi /etc/hosts`

```bash
127.0.1.1       k8s-workspace-01.example.com    k8s-workspace-01
127.0.0.1       localhost
127.0.0.1       hello-world.info
```

Now, curl that machine, 

    curl hello-world.info
    
# Simple fanout Example

    kubectl apply -f fanout-nginx-example.yaml
    kubectl describe ingress simple-fanout-example
   
Check ingress
   
    kubectl get ingress -o wide

```bash
NAME                    HOSTS         ADDRESS     PORTS   AGE
simple-fanout-example   foo.bar.com   127.0.0.1   80      9m3s
```


## References

- https://kubernetes.io/docs/concepts/services-networking/ingress/
- https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/