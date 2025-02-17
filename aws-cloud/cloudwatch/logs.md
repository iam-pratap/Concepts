# CloudWatch Logs
Amazon CloudWatch Logs is a service provided by AWS that allows you to monitor,
store, and access log files from various AWS services, as well as from custom sources.
It helps you centralize logs from different applications and systems, making
it easier to analyse and troubleshoot issues.

--> we need a cloudwatch agent in ec2 instance for logs
--> also required IAM role permissions of cloudwatch to agent

Launch an Ec2 instance

Create an IAM role with having CW full access policy attached with it

go to IAM > aws service > usecase:Ec2 > next > search policies > cloudwatch full access
next > role name > cloudwatch logs role >create role

Attach the role with EC2 instance
select the instance > actions > security > modify iam role> choose iam role and select

Login into the EC2 instance and then install the cloudwatch agent package(awslogs)
sudo yum install -y awslogs

it will create a directory awslogs

awscli.conf ----> it defines the region
change the region using vi

awslogs.conf

Configure the cloudwatch agent files to send the logs to the AWS CLoudwatch logs
(/etc/awslogs/)

start and enable the cloudwatch agent service(awslogsd)
systemctl enable --now  awslogsd.service

verify the logs in AWS
