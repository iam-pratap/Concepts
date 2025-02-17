## Alarms Implementation

Create an Ec2 instance for testing purpose

There is a two ways to implement alarms- using ec2 ui and cloudwatch ui

Now, We are crating this using Cloudwatch UI

Create alarms 

select metric > Ec2 > per-instance metrics > copy the instance id from ec2 ui 

paste in search > select the metric name(CPU utilization) > select metric

**Specify metric and conditions**

Namespace --> AWS/EC2

Metric name --> CPU Utilization

Instance ID --> Id name

Instance name --> name

Statistic --> maximum

period --> 5 minutes

**Conditions**

Threshold Type --> Static

Whenever CPUUtilization is --> Greater/Equal

than... --> 80

**Additional configuration**

Datapoints to alarm --> 1 out of 1

Missing data treatment --> default  > next

**Configure actions**

Alarm state trigger --> InAlarm

Send a notification to the following SNS topic

Create a new topic/ select the existing one > provide the email 

Ec2 action > In alarm > reboot the instance

Alarm name --> testalarm > next > create alarm

go to the email and confirm your email for notification

in our current instance, there is zero load so we need to manually increase the load using scripts

vi infinite.sh
```
#!/bin/bash
for (( ; ; ))
do 
continue
done
```
then check the graph

if CPU utilization reaches 80 or above the instance reboot

#### Using rule

Go to cloudwatch > create a rule

**Define rule detail**

Rule detail

name -->test-rule

eventbus --> default

rule type -- event pattern

**Build event pattern**

Events --> AWS events or EventBridge partner events

Event pattern --> Use pattern form

Event service --> AWS services

AWS services --> ec2

Event type --> Ec2 instance state-change Notification > all state > next

Target > target type > aws service

Select target > Sns topic > location > next > create rule

Now, if there is any changes in the state of instance you will see the email notification
