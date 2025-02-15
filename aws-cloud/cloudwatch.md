# CloudWatch
Amazon CloudWatch is a monitoring and observability service provided by AWS. It all users to collect and track metrics, monitor log files, set alarms and automatically
react to changes in AWS resources.

- It is used to monitor the performance of the AWS resources.
- Cloudwatch is all about alarms, events and logs.
  
  e.g--> ec2 instances --> host level metrics --> CPU, network, disk & status check
- Cloudwatch can monitor host-level metrics like CPU, network, disk and status check, called default metrics.
- Memory monitoring can be done separately using the custom metrics.
- Cloudwatch monitoring can be classified into two different categories
   - basic monitoring(every 5 minutes data points(free))
   - detailed monitoring(every 1 minute data points(chargeable))

## Cloudwatch Alarms

- We can create alarms in Cloudwatch with the help of metrics and then these alarms can be used to do the actions.
- EC2 => CPU Utilization > 95% => Trigger the notification(SNS)
- CloudWatch alarms can perform some actions like terminate, stop, reboot & recover the EC2 instances.
- Cloudwatch  alarms can be classified into 3 states:
   - In alarm state: Alarm threshold reached(CPU > 98%)
   - OK State: Alarm threshold not reached(CPU > 78%)
   - Insufficient state: Data not available
- Cloudwatch alarms can only trigger on a single metric. However, you can create a "composite alarm" based on multiple alarms.
- A Composite alarm is a type of alarm that allows you to combine multiple alarms and define logical expressions(AND/OR conditions) to trigger actions based on
  their states.

  ## Cloudwatch Events

  Cloudwatch events is a service provided by AWS that enables you to respond to system events and automate workflows within  your AWS environment. It works by monitoring events from various AWS services and external sources and then taking actions based on the rules that you define.

1. Event sources: Cloudwatc                                                                                                                                                  
                                                                                         h events can capture events from a wide range of aws
     services such as AWS lambda, amazon s3, amazon ec2, aws cloudtrail and more
     It can also integrate with external sources via custom event buses.

2. Rules: you can create rules in cloudwatch events to specify which events
     you want to monitor and what actions to take when those events occur.
     Rules are defined using a simple JSON-based syntax and can include filters
     to match specific event patterns.
  stopped ------>event source

3. target: Once a rule matches an incoming event, cloudwatch events can
   invoke one or more targets to perform actions such as running
   lambda functions, invoking aws step functions state machines,
   sending notifications via amazon SNS, or triggering AWS batch jobs.

4. Event Patterns: Cloudwatch events supports event patterns, which allow
   you to define more complex matching criteria based on the contents of
   the events. Event patterns use JSON syntax to specify conditions such as
   matching specific values or checking for the presence of certain fields
   in the event.

5. Event History: CLoudwatch events maintains a history of events that have been
   processed, making it easy to review past events and their associated actions.

6. Cross-account event delivery: CLoudwatch events supports cross-account
   event delivery, allowing you to define rules and targets that operate
   across multiple aws accounts within your organization


7. Scheduled Events: In addition to responding to real-time events, cloudwatch events also supports scheduled events, which allow you to trigger actions at specific times or on a recurring schedule using cron expressions.
E.g we want to stop all the EC2 instances at 11 PM and start again at 7 AM on
regular basis.

Common usecases for cloudwatch events include automating resources provisioning and management, triggering code execution in response to events,
 integrating with third-party services, and orchestrating complex workflows across multiple aws services.

  
CLoudwatch logs

Amazon CLoudwatch logs is a service provided by AWS that allows you to monitor, store, and access log files from various AWS services, as well as 
from custom sources. It helps you centralize logs from different applications and systems, making it easier to analyse and troubleshoot issues.


Cloudwatch canaries

AWS canaries, also known as AWS cloud watch synthetics canaries, are monitoring service provided by AWS that enables you to continuously monitor your endpoints and APIs. The canaries are small, lightweight scripts that run on a schedule to simulate user behaviour on your applications. They can be used to monitor the availability and latency of web applications, APIs and other internet-accessible services.

1. Proactive Monitoring:  Canaries allow you to proactively monitor your applications and enpoints, detecting issues before they impact end users.
2. Customizable Scripts: You can create custom scripts to simulate different user interactions with your application, such as logging in, navigating through pages, and making API calls.
3. Flexible Scheduling: Canaries can be scheduled to run at regular intervals, allowing you to monitor your applications continuously.
4. Alerting and Notifications: AWS canaries integrate with AWS cloudwatch alarms, allowing you to set up alerts based on predefined thresholds for latency, errors, or other metrics. You can receive notifications via various channels like email, SMS, or AWS SNS.
5. Cloudwatch integration : Canaries send monitoring data to cloudwatch, where you can view and analyse metrics, create dashboards, and set up automated actions based on specific conditions
6. multiregion support: Canaries can be deployed in multiple AWS regions to monitor the availability and latency of your applications from different geographical locations.
7. Secure Execution Environment: Canaries run in a secure, isolated environment within AWS, ensuring that your monitoring scripts do not impact the performance or security of your production.
   
