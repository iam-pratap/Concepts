# Namespace

In Kubernetes, namespaces provide a mechanism for isolating groups of resources within a single cluster. Names of resources need to be unique within a namespace, but not across namespaces. Namespace-based scoping is applicable only for namespaced objects (e.g. Deployments, Services, etc.) and not for cluster-wide objects (e.g. StorageClass, Nodes, PersistentVolumes, etc.)
- Namespaces are a way to divide cluster resources between multiple users (via resource quota).
- It is not necessary to use multiple namespaces to separate slightly different resources, such as different versions of the same software: use labels to distinguish resources within the same namespace.
- For a production cluster, consider not using the default namespace. Instead, make other namespaces and use those

### Initial namespaces
Kubernetes starts with four initial namespaces:

default: Kubernetes includes this namespace so that you can start using your new cluster without first creating a namespace.

kube-node-lease: This namespace holds Lease objects associated with each node. Node leases allow the kubelet to send heartbeats so that the control plane can detect node failure.

kube-public: This namespace is readable by all clients (including those not authenticated). This namespace is mostly reserved for cluster usage, in case that some resources should be visible and readable publicly throughout the whole cluster. The public aspect of this namespace is only a convention, not a requirement.

kube-system: The namespace for objects created by the Kubernetes system.


Create Namespaces using yml 

`vi namespaces.yml`

```
apiVersion: v1
kind: Namespace
metadata:
   name: dev
   labels:
     name: dev
```
To see the namespaces 
```
kubectl get namespaces
```
to see the details of namespaces
```
kubectl describe namespaces <namespace-name>
```

create one pod for testing

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
      command: ["/bin/bash", "-c", "while true; do echo Technical Guftgu; sleep 5 ; done"]
  restartPolicy: Never
```

Apply this configuration in `dev` namespaces
```
kubectl apply -f pod.yml -n <namespace-name>
```
Now, if you want to see the pod then check in dev namespaces

```
kubectl get pods -n <namespace-name>
```
Make a namespace default

```
kubectl config set-context --current --namespace=<namespace-name>
```
To check the current namespace

```
kubectl config view | grep namespace
```

## Managing compute resources for containers

- A Pod in kubernetes will run with no limits on cpu and memory.
- You can optionally specify how much cpu and memory(ram) each container needs.
- Scheduler decides about which nodes to place Pods, only if the node has enough cpu resources available to satisfy the Pod cpu request.
- CPU is specified in units of cores and memory is specified in units of bytes

             1 CPU = 1000m
### Two types of constraints can set for each resource type

- A `Request` is the amount of that resources that the system will guarantee for the container and kubernetes will use this value to decide on which node to place the Pod.
- A `Limit` is the maximum amount of resources that kubernetes will allow the container to use. In the case that request is not set for a container, it default to limits. If limit is not set, then default to 0.
- CPU values are specified in `millicpu` and memory in `MiB`
  
  Case1. Request = 1 CPU ;
         Limit = mention ;
         `No change` 
  
  Case2. Request = Not mention ;
         Limit = mention ;
         `Request = Limit` 
  
  Case3. Request = mention ;
         Limit = Not mention ;
         `Limit = default`

# Resource Quota

- A k8s cluster can be divided into namespaces if a container is created in a namespace that has default CPU limit, and the container does not specify its own CPU limit, then the container is assigned the default CPU limit.
- Namespaces can be assigned resources-quota objects, this will limit the amount of usage allowed to the objects in that namespace.
- You can limit:
   1. Compute
   2. Memory
   3. Storage

Here are two restrictions that a resource quota imposes on a namespace

- Every container that runs in the namespace must have its own CPU limits.
- The Total amount of CPU used by all containers in the namespace must not exceed a specified limit.

`vi podresource.yml`

```
apiVersion: v1
kind: Pod
metadata:
  name: resources
spec:
  containers:
  - name: resource
    image: centos
    command: ["/bin/bash", "-c", "while true; do echo Technical-Guftgu; sleep 5 ; done"]
    resources:                                          
      requests:
        memory: "64Mi"
        cpu: "100m"
      limits:
        memory: "128Mi"
        cpu: "200m"
```
Apply this configuration

To see the details of Pod
```
kubectl describe pod <pod-name>
```
delete pod
```
kubectl delete pod <pod-name>
```

Set Quota

`vi resourcequota.yml`

```
apiVersion: v1
kind: ResourceQuota
metadata:
   name: myquota
spec:
  hard:
    limits.cpu: "400m"
    limits.memory: "400Mi"
    requests.cpu: "200m"
    requests.memory: "200Mi"
```
Apply this configuration and create Pod using deployment

`vi deploy.yml`

```
kind: Deployment
apiVersion: apps/v1
metadata:
  name: deployments
spec:
  replicas: 3
  selector:      
    matchLabels:
     objtype: deployment
  template:
    metadata:
      name: testpod8
      labels:
        objtype: deployment
    spec:
     containers:
       - name: c00
         image: ubuntu
         command: ["/bin/bash", "-c", "while true; do echo Technical-Guftgu; sleep 5 ; done"]
         resources:
            requests:
              cpu: "200m"
```
Delete resource quota and deployment

Limit range

`vi limit-range.yml`

```
apiVersion: v1
kind: LimitRange
metadata:
  name: cpu-limit-range
spec:
  limits:
  - default:
      cpu: 1
    defaultRequest:
      cpu: 0.5
    type: Container
```
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
      command: ["/bin/bash", "-c", "while true; do echo Technical Guftgu; sleep 5 ; done"]
  restartPolicy: Never
```
Apply this configuration 

To see the details of Pod
```
kubectl describe pod <pod-name>
```
Delete this config

```
kubectl delete pod <pod-name>
```

`vi pod1.yml`

```
apiVersion: v1
kind: Pod
metadata:
  name: default-cpu-demo-2
spec:
  containers:
  - name: default-cpu-demo-2-ctr
    image: nginx
    resources:
      limits:
        cpu: "1"
```
Apply this configuration independently and now you will see the request=limits


`vi po2.yml`

```
apiVersion: v1
kind: Pod
metadata:
  name: default-cpu-demo-3
spec:
  containers:
  - name: default-cpu-demo-3-ctr
    image: nginx
    resources:
      requests:
        cpu: "0.75"
```
In this case limit=default
