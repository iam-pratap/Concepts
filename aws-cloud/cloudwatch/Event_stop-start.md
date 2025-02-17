# Using Lambda to stop and start Amazon EC2 instances at regular intervals

Go to IAM 

Create a new policy > paste

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:Start*",
                "ec2:Stop*"
            ],
            "Resource": "*"
        }
    ]
}
```
Next > give the policy name > Ec2StopStartPolicy > create policy

Create a IAM Role for `Lambda`

Create role > trusted entity type:AWS service > usecase:lambda > next

Add permissions > permissions policies > Ec2StopStartPolicy > next

Role name > Ec2StopStartRole > create role

## Create lambda function

Create function > Author from scratch

function name > `EC2_Stop_Function`

Runtime > python 3.10

Change default execution role > use an existing role > Ec2StopStartRole > create function

go to code section > paste code for stop function
```
import boto3  
region = 'us-west-1'
instances = ['i-12345cb6de4f78g9h', 'i-08ce9b2d7eccf6d26']
ec2 = boto3.client('ec2', region_name=region)

def lambda_handler(event, context):
    ec2.stop_instances(InstanceIds=instances)
    print('stopped your instances: ' + str(instances))
```
deploy

go to configuration > set the timeout to 10 Seconds

Create function > Author from scratch

function name > `EC2_Start_Function`

Runtime > python 3.10

Change default execution role > use an existing role > Ec2StopStartRole > create function

go to code section > paste code for stop function
```
import boto3  
region = 'us-west-1'
instances = ['i-12345cb6de4f78g9h', 'i-08ce9b2d7eccf6d26']
ec2 = boto3.client('ec2', region_name=region)

def lambda_handler(event, context):
    ec2.start_instances(InstanceIds=instances)
    print('started your instances: ' + str(instances))
```
deploy

go to configuration > set the timeout to 10 Seconds

## Cloudwatch Event Bridge

Go to Cloudwatch(event bridge)

Define rule detail 

Name > `Stop_EC2_Schedule`

Event bus > default

Rule type > Schedule > schedule pattern > fine-grained

cron expression > 35 06 * * ? * > UTC > next

target > AWS Service > Lambda > EC2_Stop_Function

Define rule detail 

Name > `Start_EC2_Schedule`

Event bus > default

Rule type > Schedule > schedule pattern > fine-grained

cron expression > 50 06 * * ? * > UTC > next

target > AWS Service > Lambda > EC2_Start_Function

## Configure SNS

Do this for both functions(stop, start)

Add destination for notification > Destination configuration

source > Asynchronous invocation 

condition > On success

destination type > SNS topic > select destination > save

### Testing!!!!!!!!


