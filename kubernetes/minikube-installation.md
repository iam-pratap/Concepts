### Update the Server

```
sudo apt update -y
```
### Install docker and set the permissions

```
sudo apt install docker.io -y
```
```
sudo usermod -aG docker $USER && newgrp docker
```

### Install minikube
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
```
```
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```
```
minikube start
```
### Install Kubectl

```
sudo curl -LO https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl
```
```
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
```

chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
```

```
kubectl version --client
```
