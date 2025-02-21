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

| AWS Lambda | AWS EC2 |
|------------|-----------|
| - AWS Lambda is Platform as a service | - AWS EC2 is an Infrastructure as a Service |
| - It supports only limited languages like Node js, python, java, C#, ruby, Go and powershell | - No Environment restrictions, you can run any code or language.|
| - Write your code and push the code into AWS lambda | - For the first time in EC2, you have to choose the OS and install all the software required and then push your code in EC2 |
| - You cannot log into compute instances, choose customized OS or language platform | - You can select variety of OS, instance types, network & security patches, RAM, & CPU etc |

## Terms used in Lambda

#### 1. Function
A Function is a resource that you can invoke to run your code in AWS Lambda. A Function has code that processes events, and a runtime that passes request and responses between lambda and the function code.

#### 2. Runtime
 Lambda runtimes allows functions in different languages to run in the same base execution environment. The runtime sits in between the lambda service and your function code, relaying invocation events, context information and responses between the two.

#### 3. Event 
It is a JSON formatted document that contains data for a function to process.

#### 4. Event Source/Trigger
An AWS Service such as Amazon SNS, or a customr service, that trigger your function and executes its logic.

#### 5. Downstream Resources
An AWS Service, such as DynamoDB tables or S3 buckets, that your lambda function calls once it is triggered.

#### 6. Concurrency
No of request that your function is serving in any given time.


## When Lambda Triggers

You can use AWS lambda  to run your code in response to -

- Events such as changes to data in an Amazon S3 bucket or an Amazon DynamoDB table.
- To run your code in response to HTTP request using Amazon API Gateway.
- With these capabilities, you can use lambda to easily build data processing triggers for AWS services like S3 and DynamoDB, processing streaming data stored in kinesis or create your own backend that operates at AWS Scale, performance and security.

### Example of S3

- The user create an object in a bucket.
- Amazon S3 detects the object created event.
- Amazon S3 invokes your lambda functions using the permission provided by the execution role.
- Amazon S3 knows which lambda function to invoke based on the event source mapping that is stored in the bucket notification configuration.


## AWS Lambda function configuration

- A Lambda function consist of code and any associated dependencies.
- In addition, a lambda function also has configuration information associated with it.
- Initially, you specify the configuration information when you create a lambda function.
- Lambda provides an API for you to update some of the cofiguration data.


## Lambda function configuration information includes the following key elements-

- Compute resources that you need you only specify the amount of memory you want to allocate from your lambda function.
- AWS Lambda allocates, CPU power proportional to the memory by using the same ration as a general purpose amazon EC2 instance type, such as an M3 type.
- You can update the configuration and request additional memory in 64MB increments from 128MB to 3008MB.
- Functions larger than 15
