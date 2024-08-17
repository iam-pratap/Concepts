# Volumes

All data stored inside a container is deleted if the container crashes. However the kubelet will restart it with a clean state, which means that it will not have any of the old data.

In kubernetes, a volume is attached to a Pod and shared among the containers of that Pod.

## Volume Types

1. EmptyDir
2. hostpath

The Volume has the same life span as the Pod, and it outlives the containers of the Pod. This allows data to be preserved across container restarts.

1. EmptyDir: Use this when we want to share contents b/w multiple containers on the same Pod & not to the host machine.

An EmptyDir Volume is first created when a Pod is assigned to a node, and exist as long as that Pod is running on that node.

`vi edpod.yml`

```
apiVersion: v1
kind: Pod
metadata:
  name: myvolemptydir
spec:
  containers:
  - name: c1
    image: centos
    command: ["/bin/bash", "-c", "sleep 15000"]
    volumeMounts:                                    # Mount definition inside the container
      - name: xchange
        mountPath: "/tmp/xchange"          
  - name: c2
    image: centos
    command: ["/bin/bash", "-c", "sleep 10000"]
    volumeMounts:
      - name: xchange
        mountPath: "/tmp/data"
  volumes:                                                   
  - name: xchange
    emptyDir: {}
```

Go to inside the container
```
kubectl exec -i -t myvolemptydir --container c1 -- /bin/bash
```
Go to the `mountpath` directory and create file and write some data

Again, Go to inside the container
```
kubectl exec -i -t myvolemptydir --container c2 -- /bin/
```

Go to the `mountpath` directory and you will see the which is written by the `c1`


2. hostpath: Use this when we want to access the content of a Pod/container from the hostmachine.

A hostpath volume mounts a file or directory from the host node filesystem into your Pod.

`vi hp-pod.yml`

```
apiVersion: v1
kind: Pod
metadata:
  name: myvolhostpath
spec:
  containers:
  - image: centos
    name: testc
    command: ["/bin/bash", "-c", "sleep 15000"]
    volumeMounts:
    - mountPath: /tmp/hostpath
      name: testvolume
  volumes:
  - name: testvolume
    hostPath:
      path: /tmp/data
```
