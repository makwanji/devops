# Minikube - Development kubernative cluster

## Install kubectl
```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
```

## Install docker

```bash
sudo apt update
sudo apt install docker.io -Y
sudo systemctl start docker
sudo systemctl enable docker
# add user to group
sudo usermod -aG docker ${USER}

# Compose plugin
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-compose-plugin -Y

docker compose ls
```



## Install Minikube in ubuntu
```bash
# Ref : https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

## Start minikube in force with drive none
```bash
minikube start --force
minikube addons enable metallb
minikube addons enable metrics-server
```

## Expose minikube to access from laptop

```bash
nohup socat TCP-LISTEN:8443,fork TCP:192.168.49.2:8443 &
ps -ef | grep socat
```

## copy config

```bash
# Create directories if they don't exist
mkdir -p ~/.kube
mkdir -p ~/.minikube

# Copy kubeconfig and minikube data from root
sudo cp -r /root/.kube/config ~/.kube/
sudo cp -r /root/.minikube/profiles/minikube/client.crt ~/.minikube/
sudo cp -r /root/.minikube/profiles/minikube/client.key ~/.minikube/
sudo cp -r /root/.minikube/ca.crt ~/.minikube/

# Fix ownership so your user can access them
sudo chown -R $(id -u):$(id -g) ~/.kube ~/.minikube

# Update configfile with these cert location.
```

## Configue metallb

```bash
# Install CRD
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.15.2/config/manifests/metallb-native.yaml
kubectl apply -f metallb/IPAddressPool.yml
```

## Test connection

```bash
azureuser@jig-test:~$ kubectl get pods
No resources found in default namespace.
azureuser@jig-test:~$ kubectl get svc
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   15m
azureuser@jig-test:~$
```

## Minikube reosurce tunning

```bash
### Check current usage
minikube start --cpus=4 --memory=12288
# Check usage
kubectl describe node

minikube config set cpus 4
minikube config set memory 12288
minikube start --apiserver-ips=192.168.2.41
```
