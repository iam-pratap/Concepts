replication rules
it is used for replicating the data from one bucket to another
requirement
versioning must be enabled to both the buckets

this is for new data

if there is an existing data then you have a two option
--batch operation
--sync command

lifecycle rules
using the we change the storage classes from top to bottom

but not bottom to top


-----------------
create an ec2 instance 
in ec2 dashboard

click alarms

create alarms 

> manage cloudwatch alarms > add or edit alarms

> alarm notification

> alarm action > reboot

> alarm threshold

> group sample by --> max
alarm when --> >=
consecutive period -->1
type of data to sample --> cpu utilization
percent 80
period 5 minutes
alarm name 
create

in our current instance, there is zero load so we need to manually increase the load using scripts

vi infinite.sh

#!/bin/bash
for (( ; ; ))
do
continue
done

then check the graph

if CPU utilization reaches 80 or above the instance reboot

using CloudWatch Ui

Specify metric and conditions
select metric > ec2 > per instance metric > select cpu utilization

Namespace --> AWS/EC2
metric name --> CPU Utilization
instance id --> id
instance name
statistic --> maximum
period --. 5minutes

Conditions

static

whenever CPUUtilization is
greater/equalto 
value 85%

additional configuration
datapoints to alarm
1 out of 1
missing data treatment is default

Configure actions

Alarm state trigger

> In alarm
> create new topic

> send a notification to
> --------------------------------
>
> create a rule

define rule detail

name
event bus -->default
rule type __> rule with event pattern
events> event source >aws events or event bridge patterner events
event pattern > creation method > use pattern form
event source > AWS services
AWS services > EC2
event type > EC2 instances state-change notification
Event type specification > specific state > stopping, stopped

target > sns > topic > select topic
---------------------------------------

If we have a multiple instance and we want to manage this 

scheduled Events

--> stop all the running EC2 instances at 11 PM
--> start all the stopped EC2 instance again at 7 AM
 
Event Schedule --> lambda function(start/stop function)code --> lambda role --> stop/start policy

--> lambda can be created with or without VPC.

--> lambda with VPC can access other AWS services like RDS, S3 etc

--->lambda without vpc have access to the internet by default

create a policy > Ec2stopstarppolicy

create a role > aws service > choose lambda> next > search policy name >select> give the role name > ec2stopstartrole> create


create lambda function

name ec2stopfunction
language python 3.10
exwcution role -->EXITING ROLE > select

without vpc

create a event bridge rule 
aws service > lambda function > Ec2 stop function
