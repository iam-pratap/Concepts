# Jobs and Init Container

## Jobs

We have replicasets, Daemonsets, statefulsets and deployments they all share one common property: They ensure that their pods are always running. If a pod fails, the controller restarts it or reschedules it to another node to make sure the application the pods is hosting keeps running.

#### Usecases:

- Take a backup of a DB
- Helm charts uses job
- Running batch processes
- Run a task at an schedule interval
- Log rotation

**Note**: Job does not get deleted by itself, we have to delete it.

Create a Job

`vi job.yml`

```
apiVersion: batch/v1
kind: Job
metadata:
  name: testjob
spec:
  template:
    metadata:
      name: testjob
    spec:
      containers:
      - name: counter
        image: centos:7
        command: ["bin/bash", "-c", "echo Technical-Guftgu; sleep 5"]
      restartPolicy: Never
```
Save it and apply this configuration

```
kubectl apply -f job.yml
```

To see the jobs

```
kubectl get pods
```
Use watch cmd to see the detailed info `watch !!` or `watch kubectl get pods`

### Parallelism

You can run multiple containers parallely

`vi job2.yml`

```
apiVersion: batch/v1
kind: Job
metadata:
  name: testjob
spec:
  parallelism: 5                           # Runs for pods in parallel
  activeDeadlineSeconds: 10  # Timesout after 30 sec
  template:
    metadata:
      name: testjob
    spec:
      containers:
      - name: counter
        image: centos:7
        command: ["bin/bash", "-c", "echo Technical-Guftgu; sleep 20"]
      restartPolicy: Never
```
save it and apply this configuration

```
kubectl apply -f job2.yml
```

To see the jobs

```
kubectl get pods
```

### Cron Job Pattern

It runs periodically

`vi cronjob.yml`

```
apiVersion: batch/v1beta1
kind: CronJob
metadata:
 name: bhupi
spec:
 schedule: "* * * * *"
 jobTemplate:
   spec:
     template:
       spec:
         containers:
         - image: ubuntu
           name: bhupi
           command: ["/bin/bash", "-c", "echo Technical-Guftgu; sleep 5"]
         restartPolicy: Never
```
