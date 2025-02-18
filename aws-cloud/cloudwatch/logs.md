# CloudWatch Logs
Amazon CloudWatch Logs is a service provided by AWS that allows you to monitor, store, and access log files from various AWS services, as well as from custom sources. It helps you centralize logs from different applications and systems, making it easier to analyse and troubleshoot issues.

- We need a cloudwatch agent in ec2 instance for logs
- Required IAM role permissions for connection between cloudwatch and agent.

## Configure

Launch an Ec2 instance

Create an IAM role with having CW full access policy attached with it.

Go to IAM > create Role > aws service > usecase:Ec2 > next > search policies > CW Full Access
next > role name > cloudwatch logs role > create role

Attach the role with EC2 instance

select the instance > actions > security > modify iam role > choose iam role and select

Login into the EC2 instance and then install the cloudwatch agent package(awslogs)
```
sudo yum install -y awslogs
```
it will create a directory called `awslogs`

`awscli.conf` --> It defines the region

`awslogs.conf` --> configurations and logs location

Configure the cloudwatch agent files to send the logs to the AWS CLoudwatch logs
(/etc/awslogs/)

start and enable the cloudwatch agent service(awslogsd)
```
systemctl enable --now  awslogsd.service
```
verify the logs in AWS

Now, you will see there is new folder created under log groups `/var/log/messages`
