# Persistent Volume(pv)

- A Persistent Volume is a cluster-wide resource that you can use to store data in a way that it persists beyond the lifetime of a Pod.

- The Pv is not backed by locally attached storage on a worker node but by network storage system such as EBS or NFS or a distributed filesystem like ceph.

- K8s provides APIs, for users and administrator to manage and consume storage. To manage the volume, it uses the persistent volume API resource type and to consume, it uses the persistent volume claim type.

AWS EBS ----->100GiB Storage------> Pv objects----->50GiB Pv, 30GiB Pv, 20GiB Pv

`vi pv.yml`

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: myebsvol
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Recycle
  awsElasticBlockStore:
    volumeID: <volume-id>         
    fsType: ext4
```
Apply the `configuration`

To see the Persistent volume
```
kubectl get pv
```

# Persistent Volume Claim(Pvc)

- In order to use a PV you need to claim it first, using a persistent volume claim.
- The PVC request a PV withyour desired specification(size, access modes, speed etc) from kubernetes and once a suitable persistent volume is found, it is `bound` to a persistent volume claim.
- After a successful bound to a POD, you can mount it as a volume
- Once a user finishes its works, the attached persistent volume can be released. The underlying PV can there be reclaimed and recycled for the future usage.
  

`vi pvc.yml`

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: myebsvolclaim
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```
To see the Persistent volume claim
```
kubectl get pvc
```

`vi mydeploy.yml`

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pvdeploy
spec:
  replicas: 1
  selector:      # tells the controller which pods to watch/belong to
    matchLabels:
     app: mypv
  template:
    metadata:
      labels:
        app: mypv
    spec:
      containers:
      - name: shell
        image: centos
        command: ["bin/bash", "-c", "sleep 10000"]
        volumeMounts:
        - name: mypd
          mountPath: "/tmp/persistent"
      volumes:
        - name: mypd
          persistentVolumeClaim:
            claimName: myebsvolclaim
```
Apply the `configuration` of pvc and deploy

If the status is showing bound that means storage is ready to use.

Go to inside container

```
kubectl exec -i -t <pod-name> --container <container-name> -- /bin/bash
```
Go to `mountPath` directory and create one file.

Then delete this Pod

```
kubectl delete Pod <Pod-name>
```
There will new pod created because of deployment

data is always available beacause of PV.

# Livenessprobe

`vi livenessp.yml`

```
apiVersion: v1
kind: Pod
metadata:
  labels:
    test: liveness
  name: mylivenessprobe
spec:
  containers:
  - name: liveness
    image: ubuntu
    args:
    - /bin/sh
    - -c
    - touch /tmp/healthy; sleep 1000
    livenessProbe:                                          
      exec:
        command:                                         
        - cat                
        - /tmp/healthy
      initialDelaySeconds: 5          
      periodSeconds: 5                               
      timeoutSeconds: 30
```

Apply this `configuration`

Go inside a container

```
kubectl exec -i -t <pod-name> --conatiner <container-name> -- /bin/bash
```
Now, check

```
cat /tmp/healthy
```
try `echo $?`

if result is zero that means all good and if result is non-zero that means application/cmd is not working fine.
