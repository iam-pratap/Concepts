# Lambda 

- AWS Lambda is a compute service that lets you run code without provisioning or managing servers.
- With AWS Lambda, you can run code for virtually any type of application or backend service all with zero administration.
- AWS Lambda manages all the administration it manages:
   - Provisioning and capacity of the compute fleet that offers a balance of memory, CPU, network and other resources.
   - Server and OS Maintenance.
   - High Availability and automatic scaling.
   - Monitorng fleet health.
   - Applying Security patches.
   - Deploying your code.
   - Monitoring and logging your lambda function.
   - AWS Lambda runs your code on a high-availability compute infrastructure.

- AWS Lambda runs your code on a high availability compute infrastructure.
- AWS Lambda executes your code only when needed and scales automatically from a few requests per day to thousand per second.
- You pay only for the compute time you consume - No charge when your code is not running.
-  All you need to do is supply your code in the form of one or more lambda functions to AWS lambda, in one of the languages that AWS lambda supports(currently Node js, java, powershell, C#, ruby, python & go) and the servicecan run the code on your behalf.
-  Typically the lifecycle for an AWS lambda based application includes authoring code, deploying code to AWS lambda and then monitoring and troubleshooting.
-  This is in exchange for flexibility, which means you cannot log into compute instances or customize the Operating system or language runtime.
-  If you do want to manage your own compute, you can use EC2 or Elastic beanstalk.

## How lambda Works ??

- First you upload your code to lambda in one or more lambda function.
- AWS lambda will then execute the code in your behalf.
- After the code is invoked, lambda automatically take care of provisioning and managing the required servers.

| AWS Lambda | AWS EC2|
| - AWS Lambda is Platform as a service | - AWS 
