# Deployment

### Benefits of Using Deployments

`Declarative Updates`: You define the desired state of your application, and Kubernetes automatically works to achieve it.

`Replica Management`: Deployments maintain a specified number of replica Pods, ensuring high availability and scalability.

`Rolling Updates`: Deployments can gradually update application instances with minimal downtime using strategies like rolling updates, canary deployments, or blue-green deployments.

`Self-Healing`: Kubernetes automatically replaces failed Pods with new ones.

`Rollback`: Deployments keep track of previous versions, allowing you to easily roll back to a working configuration. 

`Scaling`: You can easily scale the number of replicas up or down based on demand.   



`vi deploy.yml`

```
kind: Deployment
apiVersion: apps/v1
metadata:
   name: mydeployments
spec:
   replicas: 2
   selector:     
    matchLabels:
     name: deployment
   template:
     metadata:
       name: testpod
       labels:
         name: deployment
     spec:
      containers:
        - name: c00
          image: ubuntu
          command: ["/bin/bash", "-c", "while true; do echo Hello-World; sleep 5; done"]
```
Apply this configuration to Kubernetes API
```
kubectl apply -f deploy.yml
```

To see the deployments
```
kubectl get deploy
```

Rollout status
```
kubectl rollout status deployment mydeployments
```

Rollout history
```
kubectl rollout history deployment mydeployments
```

Rollout to previous version
```
kubectl rollout undo deploy/mydeployments
```
