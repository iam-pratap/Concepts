Amazon CloudWatch is a monitoring and observability service provided by AWS.
It all users to collect and track metrics, monitor log files, set alarms and automatically
react to changes in AWS resources.

- CLoudWatch is the AWS service which is used to monitor the performance of the AWS resources.
- Cloudwatch in aws can be used to monitor all AWS services.
- cloudwatch is all about alarms, events and logs.

- e.g--> ec2 instances --> host level metrics --> CPU, network, disk & status check
- cloudwatch can monitor host level metrics like CPU, network, disk and status check
- which is called as default metrics
- memory monitoring can be done separately using the custom metrics.
- cloud watch monitoring can be classified into two different categories
- basic monitoring(every 5 minutes data points(free))
- detailed monitoring(every 1 minute data points(chargeable))

Cloudwatch alarms

- We can create alarms in cloudwatch with the help of metrics and then these alarms
  can be used to do the actions.
- EC2 => CPU Utilization > 95% => Trigger the notification(SNS)
- CloudWatch alarms can perform some actions like terminate, stop, reboot & recover
  the EC2 instances.
- Cloudwatch  alarms can be classified into 3 states:
   - In alarm state: Alarm threshold reached(CPU > 98%)
   - OK state: Alarm threshold not reached(CPU > 78%)
   - Insufficient state: Data not available
- Cloudwatch alarms can only trigger on a single metric. However, you can create
  a "composite alarm" based on multiple alarms.
- A Composite alarm is a type of alarm that allows you to combine multiple alarms
  and define logical expressions(AND/OR conditions) to triggered actions based on
  their states.

  Cloudwatch Events

  Cloudwatch events is a service provided by AWS that enable you to respond to
  system events and automate workflows within  your AWS environment.
  It works by monitoring events from various AWS services and external sources,
  then taking actions based on rules that you define.

1. Event sources: Cloudwatch events can capture events from a wide range of aws
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


  

  
