# MetalLB Extensions

MetalLB is a load-balancer implementation for bare metal Kubernetes clusters, using standard routing protocols.   
Kubernetes does not offer an implementation of network load-balancers for bare metal cluster. So that when any service
type is LoadBalancer then it's ExternalIP showing <pending>. It's basically endless waiting.  


# MeatLB Setup

##1.Installation by manifest,

    kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.3/manifests/metallb.yaml

##2.Verifies everything is properly or not,    
    
    kubectl get ns
    kubectl get all -n metallb-system
    kubectl get nodes -o wide

##3.Layer2 configuration, Create metallb-configmap

We like to expose `LoadBalancer`, `External-IP` address so, define IP Ranges,

    vi metallb-configmap.yaml

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 172.16.0.220-172.16.0.250
```

Alternatives:

```bash
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 172.16.0.220-172.16.0.250
EOF
```

> Note: In our case VM or Machine Network `private_network` static IP is `172.16.0.201`. So our ip range are between machine-ip series.
> Example: `(172.16.0.220 - 172.16.0.250)`. Here, we change those range but remember Ip series should be same. One thing when one service 
> run then get External-IP in between that ranges. And, External-IP will be accessible from outside.


## 4.Now, apply configuration, deployment and service

    kubectl apply -f metallb-configmap.yaml
    kubectl apply -f nginx-deployment.yaml
    kubectl apply -f nginx-service.yaml

## Check Service information 
    
    kubectl get services -o wide 

Output,

```bash
NAME            TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)        AGE    SELECTOR
kubernetes      ClusterIP      10.152.183.1    <none>         443/TCP        145m   <none>
nginx-service   LoadBalancer   10.152.183.56   172.16.0.220   80:32627/TCP   45m    app=nginx
```

Successfully, we get your `EXTERNAL-IP` for `nginx-service`, now we can access that service from outside and it manage 
load balancing.

- `Open browser` and run, visit [http://172.16.0.220](http://172.16.0.220)
- Or, `CURL` from terminal, visit `curl http://172.16.0.220`

Hope, We are able to get `NGINX Welcome Page`. Great!




## References:

- https://github.com/ecorbett135/kubernetes-dev-cluster
- https://cloudmanagement.navisite.com/container-management-how-to-build-a-kubernetes-development-cluster/
- https://metallb.universe.tf/installation/
- https://itnext.io/kubernetes-metallb-vlan-3e5f310a4510
- https://stackoverflow.com/questions/54506269/simple-ingress-from-host-with-microk8s
- https://ubuntu.com/tutorials/install-a-local-kubernetes-with-microk8s#4-accessing-the-kubernetes-and-grafana-dashboards