# Amazon CloudWatch

## Overview

Amazon CloudWatch is a monitoring and observability service for AWS resources and applications. It provides data and actionable insights to monitor applications, understand and respond to system-wide performance changes, and optimize resource utilization.

## Key Features
- Collects and tracks metrics, logs, and events
- Set alarms and automate actions
- Visualize data with dashboards
- Integrates with most AWS services
- Supports custom metrics and logs
- Enables anomaly detection and insights

## Metrics
- Built-in metrics for AWS services (EC2, RDS, Lambda, etc.)
- Custom metrics for application-specific monitoring
- Granularity: 1-minute (standard), 1-second (high-resolution)

### CloudWatch EC2 Detailed monitoring

- EC2 instance metrics have metrics “every 5 minutes”
- Host Level metrics consist of:
	- CPU
	- Network
	- Disk
	- Status Check
- With detailed monitoring (for a cost), you get data “every 1 minute”
- Use detailed monitoring if you want to more prompt scale your ASG!
- The AWS Free Tier allows us to have 10 detailed monitoring metrics
- **Note:** EC2 Memory usage is by default not pushed (must be pushed from inside the instance as a custom metric)
- **Note:** RAM Utilization is a custom metric! By default, EC2 monitoring is 5 minute intervals, unless you enable detailed monitoring, which will then make it 1 minute intervals

### AWS CloudWatch Custom Metrics

- Possibility to define and send your own custom metrics to CloudWatch
- Ability to use dimensions (attributes) to segment metrics
    - Instance.id
    - Environment.name
- Metric resolution:
    - Standard: 1 minute
    - High Resolution: up to 1 second (StorageResolution API parameter - Higher cost)
- Use API call **PutMetricData**
- Use exponential back off in case of throttle errors

## Logs
- Centralized log collection and storage
- Real-time log streaming and analysis
- Log groups and log streams for organization
- Metric filters to extract insights from logs

### AWS CloudWatch Logs

- Applications can send logs to CloudWatch using the SDK
- CloudWatch can collect log from:
    - Elastic Beanstalk: collection of logs from application
    - ECS: collection from containers
    - AWS Lambda: collection from function logs
    - VPC Flow Logs:VPC specific logs
    - API Gateway
    - CloudTrail based on filter
    - CloudWatch log agents: for example on EC2 machines
    - Route53: Log DNS queries
- CloudWatch Logs can go to:
    - Batch exporter to S3 for archival
    - Stream to ElasticSearch cluster for further analytics
- CloudWatch Logs can use filter expressions
- Logs storage architecture:
    - Log groups: arbitrary name, usually representing an application. Log expiration policy should be defined at this level.
    - Log stream: instances within application / log files / containers
- Can define log expiration policies (never expire, 30 days, etc..)
- Using the AWS CLI we can tail CloudWatch logs
- To send logs to CloudWatch, make sure IAM permissions are correct!
- Security: encryption of logs using KMS at the Group Level

## Alarms
- Monitor metrics and trigger actions (SNS, Lambda, Auto Scaling)
- Set thresholds for alerting
- Composite alarms for complex conditions

### Alarms are used to trigger notifications for any metric

- Alarms can go to Auto Scaling, EC2 Actions, SNS notifications
- Various options (sampling, %, max, min, etc...)
- Alarm States:
    - OK
    - INSUFFICIENT_DATA
    - ALARM
- Period:
    - Length of time in seconds to evaluate the metric
    - High resolution custom metrics: can only choose 10 sec or 30 sec

## Dashboards
- Visualize metrics and logs in customizable dashboards
- Share dashboards across teams

## Events
- Detect and respond to changes in AWS resources
- Automate workflows with EventBridge (CloudWatch Events)

### AWS CloudWatch Events

- Schedule: Cron jobs
- Event Pattern: Event rules to react to a service doing something
    - Ex: CodePipeline state changes
- Triggers to Lambda functions, SQS/SNS/Kinesis Messages
- CloudWatch Event creates a small JSON document to give information about the change

## Insights & Anomaly Detection
- Automatic detection of metric anomalies
- Log Insights for querying and analyzing log data

## Best Practices
- Monitor key metrics and set up alarms
- Use dashboards for real-time visibility
- Centralize log collection and analysis
- Automate responses to critical events
- Enable anomaly detection for proactive monitoring

## Exam Tips

- Amazon CloudWatch is a monitoring service to monitor your AWS resources, as well as the applications that you run on AWS.
- Host Level Metrics Consist of:
    - CPU
    - Network
    - Disk
    - Status Check
- RAM Utilization is a custom metric
- Custom Metrics: Minimum granularity is 1 minute
- Terminated Instances: You can retrieve data from any terminated EC2 or ELB instance after its termination. CloudWatch Logs by default are stored indefinitely.
- Metric Granularity
    - 1 minute for detailed monitoring
    - 5 minutes for standard monitoring
- CloudWatch can be used on premise: Not restricted to just AWS resources. Can be on premise too. Just need to download and install the SSM agent and CloudWatch agent.
- You can create _cross-account cross-Region dashboards_, which summarize your CloudWatch data from multiple AWS accounts and multiple Regions into one dashboard. From this high-level dashboard you can get a view of your entire application, and also drill down into more specific dashboards without having to log in and out of accounts or switch Regions. You can create cross-account cross-Region dashboards in the AWS Management Console and programmatically.