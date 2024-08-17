# Pod

### Single Container Pod

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
      command: ["/bin/bash", "-c", "while true; do echo Hello World; sleep 5 ; done"]
  restartPolicy: Never         # Defaults to Always
```
Run a command to apply this manifest to k8s API

```
kubectl apply -f <manifest-name>
```
Check the logs

```
kubectl logs -f <pod-name>
```
Check the details of pod

```
kubectl describe pod <pod-name>
```

### Multicontainer pods

`vi multipod.yml`

```
kind: Pod
apiVersion: v1
metadata:
  name: testpod3
spec:
  containers:
    - name: c00
      image: ubuntu
      command: ["/bin/bash", "-c", "while true; do echo container-zero; sleep 5 ; done"]
    - name: c01
      image: ubuntu
      command: ["/bin/bash", "-c", "while true; do echo container-one; sleep 5 ; done"]
```

To see the specific container logs
`kubectl logs -f <pod-name> -c <container-name>`

if we want give any message or extra information then we use `annotations`

```
 metadata:
  name: testpod
  annotations:
   description: <message>
```
create pod using command
```
kubectl run <pod-name> --image=nginx
```

Get a Shell to a Running Container
```
kubectl exec -i -t <pod-name> --container <container-name> -- /bin/bash
```

Delete a Pod
```
kubectl delete pod <pod-name>
```

Delete all Pods
```
kubectl delete pods --all
```

### Define the environments variables

`vi podenv.yml`

```
kind: Pod
apiVersion: v1
metadata:
  name: environments
spec:
  containers:
    - name: c00
      image: ubuntu
      command: ["/bin/bash", "-c", "while true; do echo Hello-World; sleep 5 ; done"]
      env:                        # List of environment variables to be used inside the pod
      - name: MYNAME
        value: HONEY
```

Check env variables & go to inside the container
`echo $MYNAME`

o/p--> HONEY

### Pod with ports

`vi pod4.yml`

```
kind: Pod
apiVersion: v1
metadata:
  name: testpod4
spec:
  containers:
    - name: c00
      image: httpd
      ports:
       - containerPort: 80
```
To see the all details of pod
```
kubectl get pods -o wide
```
If you are using minikube then `minikube ssh`

copy the pod IP Address

Check If webserver is working or not using this `curl <IP-Address>:port-number`

Result:

`<html><body><h1>It works!</h1></body></html>`
