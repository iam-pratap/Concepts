# Horizontal Pod Autoscaler (HPA)

- Kubernetes has the possibility to automatically scale pods based on observed CPU utilization, which is horizontal pod autoscaling.
- Scaling can be done only for scalable objects like controller,  deployment or replicaset.
- The controller periodically adjust the number of replicas in a replication controller or deployment to match the observed average CPU utilization to the target specified by user.
- The HPA is implemented as a controlled loop with a period controlled by the controller manager's `-horizontal-pod-autoscaler-sync-period` flag(default value of 30 sec).
- For per-pod resource metrics(like CPU), the controller fetches the metrics from the resource metrics API for each pod targeted by Horizontalpodautoscaler.
- Cooldown period to wait before another downscale operation can be performed is controlled by `--horizontal-pod-autoscaler-downtime-stabilization` flag(dafault value of 5 min)
- Metric Server needs to be deployed in the cluster to provide metrics via resource metrics API.

Install Metrics Server

```
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```
Now, edit `components.yml` file in cert section

```
- --kubelet-insecure-tls
```
Again apply this configuration
```
kubectl apply -f components.yaml
```
To see the namespaces

```
kubectl get namespaces
```
There is namespace called kube-system in which metric-server pod is running.

```
kubectl get pods -n kube-system
```
To see the logs of metric-server
```
kubectl logs -f <metric-server-pod-name> -n kube-system
```
Now, create one deployment file

`vi deploy`

```
kind: Deployment
apiVersion: apps/v1
metadata:
   name: mydeploy
spec:
   replicas: 1
   selector:
    matchLabels:
     name: deployment
   template:
     metadata:
       name: testpod8
       labels:
         name: deployment
     spec:
      containers:
        - name: c00
          image: httpd
          ports:
          - containerPort: 80
          resources:
            limits:
              cpu: 500m
            requests:
              cpu: 200m
```
Apply this `configuration`

To get the all objects at one place
```
kubectl get all
```
you will see pod, service, deployment and replicaset

Enable Horizontal pod autoscaler
```
kubectl autoscale deployment mydeploy --cpu-percent=20 --min=1 --max=10
```
```
kubectl get all
```
Now, you will see one more object added here `horizontalpodautoscaler.autoscaling`

Open two terminal using one ec2 instance

Now test the CPU utilization

1st terminal
```
watch kubectl get all
```

2nd terminal
Go to inside container
```
kubectl exec -i -t <pod-name> -- /bin/bash
```
Run this `apt update `command multiple times, you will see CPU utilization increasing and according to this new pod created.
