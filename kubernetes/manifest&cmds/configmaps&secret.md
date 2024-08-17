# ConfigMaps

- While Performing application deployments on K8s cluster, sometimes we need to change the application configuration file depending on environments like dev, QA, Staging or Production.
- It allows us to handle configuration files much more efficiently.
- ConfigMaps are useful for storing and sharing non-sensitive, unencrypted configuration information.
- ConfigMaps can be accessed in following ways:
  1. As volume in the Pod
  2. As environment variables

create one sample file `sample.conf` and write some data in it

create configmap using conf file

```
kubectl create configmap <map-name> --from-file=<conf-file-name>
```
To see the configmap

```
kubectl get configmap
```

To see the details of configmaps
```
kubectl describe confimap <map-name>
```

### i. As volumes in the Pod

'vi volconfigmaps'

```
apiVersion: v1
kind: Pod
metadata:
  name: myvolconfig
spec:
  containers:
  - name: c1
    image: centos
    command: ["/bin/bash", "-c", "while true; do echo Technical-Guftgu; sleep 5 ; done"]
    volumeMounts:
      - name: testconfigmap
        mountPath: "/tmp/config"   # the config files will be mounted as ReadOnly by default here
  volumes:
  - name: testconfigmap
    configMap:
       name: mymap   # this should match the config map name created in the first step
       items:
       - key: sample.conf
         path: sample.conf
```
Apply the `configuration`

Go inside a Pod
```
kubectl exec -i -t <pod-name> -- /bin/bash
```

then check the sample.conf file using volume.

### ii. As environment variables

`vi envconfigmaps.yml`

```
apiVersion: v1
kind: Pod
metadata:
  name: myenvconfig
spec:
  containers:
  - name: c1
    image: centos
    command: ["/bin/bash", "-c", "while true; do echo Technical-Guftgu; sleep 5 ; done"]
    env:
    - name: MYENV         # env name in which value of the key is stored
      valueFrom:
        configMapKeyRef:
          name: mymap      # name of the config created
          key: sample.conf
```

Go inside a Pod
```
kubectl exec -i -t <pod-name> -- /bin/bash
```
now, check using `env`

# Secrets

- Secrets provide you with a mechanism to use such information in a safe and reliable way.
- You don't want sensitive information such as a database password or an API key kept around in clear text.
- As per-secret size limit of 1MB.
- The API server stores secrets as plain-text in etcd.

create files `username.txt` & `password.txt` for secrets

```
echo "root" > username.txt; echo "mypassword123" > password.txt 
```
create secret
```
kubectl create secret generic <secret-name> --from-file=<file-name.txt>
```
To see the secret
```
kubectl get secret
```
to see the details of secret
```
kubectl describe secret mysecret
```

'vi deploysecrets.yml'

```
apiVersion: v1
kind: Pod
metadata:
  name: myvolsecret
spec:
  containers:
  - name: c1
    image: centos
    command: ["/bin/bash", "-c", "while true; do echo Technical-guftgu; sleep 5 ; done"]
    volumeMounts:
      - name: testsecret
        mountPath: "/tmp/mysecrets"   # the secret files will be mounted as ReadOnly by default here
  volumes:
  - name: testsecret
    secret:
       secretName: mysecret
```
Apply this configuration

Go inside the pod
```
kubectl exec -i -t <pod-name> -- /bin/bash
```
Now, you will see the secrets for my application
