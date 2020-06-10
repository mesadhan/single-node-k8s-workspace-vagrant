# Service Access Through NodePort

## 1. Now, apply configuration, deployment and service

    kubectl apply -f nginx-deployment.yaml
    kubectl apply -f nginx-service.yaml

## 2. Check Service information 
    
    kubectl get services -o wide 

Output,

```bash
NAME            TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE    SELECTOR
kubernetes      ClusterIP   10.152.183.1     <none>        443/TCP        162m   <none>
nginx-service   NodePort    10.152.183.158   <none>        80:30000/TCP   32s    app=nginx
```


## 3. Service Access Guides

Available into node, VM or Machine [Internal]
    
    curl http://machine-ip-address:<node-port>
    
    curl http://<server-hostname>:30000
    curl http://k8s-workspace-01:30000
    
    curl http://<machine-ip-address>:30000
    curl http://172.16.0.201:30000
    
    curl http://localhost:30000

Available outside of node, VM or Machine [External].
    
    curl http://vm-given-private-ip-address:<node-port>
    curl http://172.16.0.201:30000

Hope, We are able to get `NGINX Welcome Page`. Great!


## 4. Queries

- If i'm running two replica then, which pods are access via services single nodePort?

