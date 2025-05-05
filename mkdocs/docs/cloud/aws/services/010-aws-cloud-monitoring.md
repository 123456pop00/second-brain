# AWS Cloud Monitoring

## Overview

AWS provides a comprehensive set of monitoring and observability services to help you track the health, performance, and security of your cloud resources and applications.

## Monitoring Services

### Amazon CloudWatch
- Collects and tracks metrics, logs, and events
- Set alarms and automate actions
- Visualize data with dashboards
- Integrates with most AWS services

### AWS CloudTrail
- Records AWS API calls for your account
- Provides event history for auditing and compliance
- Detects unusual activity in your AWS account

### AWS Config
- Tracks resource configurations and changes
- Enables compliance auditing and security analysis
- Provides configuration history and snapshots

### AWS X-Ray
- Distributed tracing for applications
- Analyzes and debugs production and distributed applications
- Visualizes service maps and traces

### AWS Trusted Advisor
- Provides real-time guidance to help provision resources following AWS best practices
- Checks for cost optimization, performance, security, fault tolerance, and service limits

## Logging & Auditing

- Enable logging for all AWS services where possible
- Store logs securely in Amazon S3 or CloudWatch Logs
- Use CloudTrail for API activity auditing
- Set up log retention and archival policies

## Alarms & Notifications

- Use CloudWatch Alarms to monitor metrics and trigger actions
- Integrate with SNS for notifications
- Automate remediation with Lambda or Systems Manager Automation

## Best Practices
- Centralize monitoring and logging
- Set up alerts for critical metrics and events
- Regularly review logs and audit trails
- Use dashboards for real-time visibility
- Automate responses to common issues
