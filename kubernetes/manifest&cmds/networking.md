# Kubernetes Networking

### K8s Networking Addresses four concerns:


1. Container to container communication on same pod, happens using `localhost:80`

`vi pod.yml`

```
kind: Pod
apiVersion: v1
metadata:
  name: testpod
spec:
  containers:
    - name: c00
      image: ubuntu
      command: ["/bin/bash", "-c", "while true; do echo Hello-World; sleep 5 ; done"]
    - name: c01
      image: httpd
      ports:
       - containerPort: 80
```

Apply this `Configuration` and check communication between containers.

To get the container

```
kubectl exec -i -t testpod --container c00 -- /bin/bash
```
Update the machine and install `curl`

```
apt update && apt install curl
```

check communication 
```
curl localhost:80
```


2. Pod to Pod communication on same worker node, happens using `Pod-IpAddress:80`

`vi pod1.yml`

```
kind: Pod
apiVersion: v1
metadata:
  name: testpod
spec:
  containers:
    - name: c01
      image: httpd
      ports:
       - containerPort: 80

```

`vi pod2.yml`

```
kind: Pod
apiVersion: v1
metadata:
  name: testpod
spec:
  containers:
    - name: c02
      image: nginx
      ports:
       - containerPort: 80
```

Apply the `configuration` of pod1 and pod2

If you are using minikube, `minikube ssh`

check communication

```
curl <Pod Ip-address>80
```

## Services

Service object is an logical bridge b/w Pods and end users, which provides Virtual IP

3. The Service resources lets you expose an application running in Pods to be reachable from outside your cluster.

`Virtual-IP:RS --->mapped` i.e 10.10.10.10:80 using this IP, we can access any Pod even after any Pod is failed or the new one.

Services can be exposed in difficult ways by specifying a type in the service spec:
1. Cluster IP (deafult)
2. NodePort
3. Load Balancer
4. Headless

By Default, service can run only between ports 30,000 - 32,767

1. Cluster IP: Exposes Virtual IP only reachable from within the cluster.

`vi deploy.yml`

```
kind: Deployment
apiVersion: apps/v1
metadata:
   name: mydeployments
spec:
   replicas: 1
   selector:      # tells the controller which pods to watch/belong to
    matchLabels:
     name: deployment
   template:
     metadata:
       name: testpod1
       labels:
         name: deployment
     spec:
      containers:
        - name: c00
          image: httpd
          ports:
          - containerPort: 80
```

`vi services.yml`

```
kind: Service                             # Defines to create Service type Object
apiVersion: v1
metadata:
  name: demoservice
spec:
  ports:
    - port: 80                               # Containers port exposed
      targetPort: 80                     # Pods port
  selector:
    name: deployment                    # Apply this service to any pods which has the specific label
  type: ClusterIP                       # Specifies the service type i.e ClusterIP or NodePort
```

Apply this `Configuration` and check service type.

To get the service

```
kubectl get svc
```
check `cluster-IP` it's a static IP and it will not change even after if you delete the pods.

Check communication, If you are using minikube `minikube ssh`

```
curl <Virtual-Ip-address>80
```

3. NodePort: Makes a service accessible from outside the cluster.
   
`vi deploy.yml`

```
kind: Deployment
apiVersion: apps/v1
metadata:
   name: mydeployments
spec:
   replicas: 1
   selector:      # tells the controller which pods to watch/belong to
    matchLabels:
     name: deployment
   template:
     metadata:
       name: testpod1
       labels:
         name: deployment
     spec:
      containers:
        - name: c00
          image: httpd
          ports:
          - containerPort: 80
```

`vi services.yml`

```
kind: Service                             # Defines to create Service type Object
apiVersion: v1
metadata:
  name: demoservice
spec:
  ports:
    - port: 80                               # Containers port exposed
      targetPort: 80                     # Pods port
  selector:
    name: deployment                    # Apply this service to any pods which has the specific label
  type: NodePort                       # Specifies the service type i.e ClusterIP or NodePort
```

Apply the `configuration` and check the service type

Get the service and check the type, clusterIp and port number
```
kubectl get svc
```
To see the details of service
```
kubectl describe svc <service-name>
```

check `Public-dns:portnumber`
