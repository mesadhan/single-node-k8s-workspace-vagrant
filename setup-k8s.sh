#!/bin/sh -e

# Set environment variables so that the setup script does
# not ask any questions during provisioning. We'll let the
# machine figure out its own public IP.

sudo snap install microk8s --classic

# short kubectl, to avoid each time microk8s.kubectl
alias kubectl='sudo microk8s.kubectl'
source ~/.bashrc

# microk8s user get root permission
sudo usermod -a -G microk8s root


#========== enable kubectl service
sudo microk8s.enable dns
sudo microk8s.enable ingress
# sudo microk8s.enable dns storage


#========== sudo microk8s.kubectl version
# sudo microk8s.kubectl get no
# sudo microk8s.kubectl get pods
# kubectl get deployments
# kubectl get deployments -o wide
# kubectl get replicaset

#========== show the default user/password of kubectl tool.
# sudo microk8s.kubectl get config view
# sudo microk8s.kubectl get cluster-info
# sudo microk8s.kubectl proxy

#========== Deploy simple application
# kubectl create deployment nginx-depl_name --image=nginx
# kubectl edit deployment nginx-depl_name
# kubectl logs {pods_name}
# kubectl describe pod {pods_name}
# kubectl exec -it {pod-name} -- bin/bash\

#========== Configuration
# sudo microk8s.stop
# sudo microk8s.start

echo 'microk8s installed successfully.'