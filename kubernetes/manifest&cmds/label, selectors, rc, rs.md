# Objects

### Labels

`vi labels.yml`

```
kind: Pod
apiVersion: v1
metadata:
  name: mypod
  labels:                                                   
    env: development
    class: pods
spec:
    containers:
       - name: c00
         image: ubuntu
         command: ["/bin/bash", "-c", "while true; do echo Hello-World; sleep 5 ; done"]
```

To see the labels
```
kubectl get pods --show-labels
```
Add the labels to pod using cmd

```
kubectl label pods <pod-name> myname=honey
```

For this, there are two types of selectors
1. Equality based(=, !=)
2. set based(in, notin and exists)

Replication Controller only supports Equality-based selector whereas Replicaset supports Equality-based selector as well as set-based selectors.
i.e filtering according to set of values

Match the labels, check if the labels are available or not.

Equality based
```
kubectl get pods -l env=development
```

Set-based
```
kubectl get pods -l 'env in(development, testing)'
```

### Node Selector

`vi nodesel.yml`

```
kind: Pod
apiVersion: v1
metadata:
  name: nodelabels
  labels:
    env: development
spec:
    containers:
       - name: c00
         image: ubuntu
         command: ["/bin/bash", "-c", "while true; do echo Hello-World; sleep 5 ; done"]
    nodeSelector:                                         
       hardware: t2-medium
```
Apply this `configuration` to kubernetes API and check if the pod is up and running or not and if not then check the node labels `kubectl get nodes --show-labels`
```
kubectl label nodes <node-name> hardware=t2-micro
```

To Remove or rename use `--overwrite`
```
kubectl label --overwrite nodes <name-name> hardware=m4.large
```

### Replication Controller

`vi rc.yml`

```
kind: ReplicationController               
apiVersion: v1
metadata:
  name: myreplica
spec:
  replicas: 2            
  selector:        
    myname: honey Pr                            
  template:                
    metadata:
      name: testpod6
      labels:            
        myname: honey
    spec:
     containers:
       - name: c00
         image: ubuntu
         command: ["/bin/bash", "-c", "while true; do echo Hello-World; sleep 5 ; done"]
```
Scale up and scale down
```
kubectl scale --replicas=8 rc -l myname=honey
```

### ReplicaSets

`vi rs.yml`

```
kind: ReplicaSet                                    
apiVersion: apps/v1                            
metadata:
  name: myrs
spec:
  replicas: 2  
  selector:                  
    matchExpressions:                             # these must match the labels
      - {key: myname, operator: In, values: [shivo, Honey, karan]}
      - {key: env, operator: NotIn, values: [production]}
  template:      
    metadata:
      name: testpod7
      labels:              
        myname: Honey
    spec:
     containers:
       - name: c00
         image: ubuntu
         command: ["/bin/bash", "-c", "while true; do echo Welcome; sleep 5 ; done"]
```
