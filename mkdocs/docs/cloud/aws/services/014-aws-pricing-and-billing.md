# AWS Pricing and Billing

## Overview

AWS offers a flexible, pay-as-you-go pricing model for its cloud services. Understanding pricing, billing, and cost management tools is essential for optimizing your AWS usage and controlling costs.

## Pricing Models

### On-Demand
- Pay for compute or storage by the hour or second with no long-term commitments
- Ideal for short-term, unpredictable workloads

### Reserved
- Reserve capacity for 1 or 3 years
- Significant discount compared to on-demand pricing
- Best for steady-state or predictable usage

### Savings Plans
- Flexible pricing model for compute usage
- Commit to a consistent amount of usage (measured in $/hour) for 1 or 3 years
- Applies to EC2, Fargate, and Lambda

### Spot Instances
- Purchase unused EC2 capacity at a discount
- Prices fluctuate based on supply and demand
- Suitable for fault-tolerant, flexible applications

## Free Tier
- Limited free usage of certain AWS services for 12 months after sign-up
- Always Free offers for select services

## Cost Management Tools

### AWS Cost Explorer
- Visualize, understand, and manage AWS costs and usage
- Create custom reports and forecasts

### AWS Budgets
- Set custom cost and usage budgets
- Receive alerts when thresholds are exceeded

### AWS Pricing Calculator
- Estimate monthly costs for AWS services
- Model solutions before deployment

### Consolidated Billing
- Combine usage across multiple AWS accounts
- Take advantage of volume discounts

## Billing and Invoicing
- Monthly billing cycles
- Detailed billing reports available in the AWS Billing Console
- Payment methods: credit card, ACH, wire transfer

## Best Practices
- Monitor usage and set up budgets
- Use tagging for cost allocation
- Review and optimize reserved and spot instance usage
- Take advantage of the free tier and volume discounts
- Regularly review billing and usage reports

## Pricing Models in the Cloud

- **Pay as you go**: pay for what you use, remain agile, responsive, meet scale demands.
- **Save when you reserve**: minimize risks, predictably manage budgets, comply with long-term requirements.
  - Reservations are available for EC2 Reserverd Instance, DynamoDB Reserved Capacity, ElastiCache Reserverd Nodes, etc.
- **Pay less by using more**: volume-based discounts.
- **Pay less as AWS grows**: cost-reductions as aws data-centers are created, they are known to do cost-reduction yearly.


### Free services & Free tier in AWS

- IAM
- VPC
- Consolidated Billing
- Elastic Beanstalk         ---- you pay for the resources created
- CloudFormation            ---- you pay for the resources created
- Auto Scaling Groups       ---- you pay for the resources created
- [Free Tier](https://aws.amazon.com/free/)

## Credits

Credits are applied in the following order:
1. Soonest expiring
2. Least number of applicable products
3.Oldest credit

## Pricing per services & networking

### EC2

- Charged for what you use
- Number of instances
- Instance configuration (phyical capacity, region, os and sotftware, instance type, instance size)
- ELB running time and amount of data processed
- Detailed monitoring (enable if you want cloudwatch metrics every minute, but it costs)

**Pricing Models**:
- On-demand instances:
  - Minimum of 60 second, you **pay per second** (Linux/Windows) or per hour
- Reserverd instances
  - Up to 75% discount compared to On-demand on hourly rate
  - 1-3 year commitmennt
  - All upfront, partial upfront, no upfront payment (less discount later you pay)
- Spot Instances
  - Up to 90% discount compared to On-demand on hourly rate
  - Bid for unused capacity (you can lose if someone wants to outbid you for the spot instances)
- Dedicated Host
  - On-demand
  - Reservation for 1-3 years commitment
- Saving Plans as an alternative to save on sustained usage

### Lambda

- pay per call
- pay per duration

### ECS
- EC2 Lanuch Type Model: no additional fees, you pay for the aws resources stored and created in your application

### Fargate
- Fargate Launch Type Model: Pay for vCPU and memory resources allocated to your applications in your containers

### S3
- Storage Class: S3 Standard, S3 Infrequent Access, S3 One-Zona IA, S3 Intelligent Tiering, S3 Glacier and S3 Glacier Deep Archive
- Number and size of objects (price can be tiered based on volume)
- Number and type of requests
- Data transfer out of the S3 region
- S3 Transfer Acceleration
- Lifecycle transitinos

Note: Similar Service **Elastic File System (EFS)** (pay per use, has infrequent access & lifecycle rules)

### EBS

- Volume Type (based on performance)
- Storage volume in GB per month **provisioned**
- Input/Output operations per second (IOPS):
  - General Purpose SSD (included in the price)
  - Provisioned IOPS SSD - pay per provisioned amount in IOPS
  - Magnetic: Number of requests
- Snapshots (Added data cost per GB per month)
- Data Transfer (outbound data transfer are tiered for volume discounts, inbound is free)

### RDS

- Per hour billing
- Database characteristics:
  - Engine
  - Size
  - Memory Class
- Purchase Type
  - On-demand
  - Reserved instance (1 or 3 years) with required up-front
- Backup Storage (Usually there is no additional charge for backup storage up to 100% of your total database storage for a region)
- Additiona Storage (per GB per month)
- Number of I/O request per month
- Deplyoment Type (Single AZ/Multiple AZ)
- Data Transfer (outbound date transfer are tiered for volume discounts, inbound is free)

### Cloudfront

- Pricing different across geographic regions
- Aggregated for each edge location, then applied to your bill 
- Data Transfer Out (volume discount)
- Number of HTTP(s) requests

### Networking Costs in AWS per GB

- Inbound trafic from outside aws is free
- Trafic between services in the same AZ are free
- Trafic between availability zones (using private IP) costs ($0.01)
- Trafic between availabity zones (using public ip/elastic ip) costs ($0.02)
- Trafic between regions costs ($0.02)

## Saving Plans

You have different type of plans where you commit a certain amount of dollars per hour for 1 or 3 years
- EC2 Saving Plans (commit to usage of individual instance families in a region)
- Compute Saving plans (for EC2, Fargate, Lambda), very flexible, it just requires a $ commitment, up to 66% reduction for a 1 or 3 years commitment
- Machine Learning Saving Plans for services like SageMaker

## Costs Tools
### Services for cost optimization

- [Compute Optimizer](https://aws.amazon.com/compute-optimizer/): reduce costs and improve performance by recommending optimal aws for your workloads using ML. Also helps you choose optimal configurations and right-size your workloads (over/under provisioned). Supports: EC2, ASG, EBS, Lambda

### Estimating Costs
- [Pricing Calculator](https://calculator.aws): estimate the cost for your solution architecture

### Tracking Costs
- Billing Dashboard: shows an overview of the costs incured
  - also has a free tier dashboard to monitor free tier usage
- Cost Allocation Tags: allows to track costs on a detalied level. You also have [Tag Editor](https://docs.aws.amazon.com/tag-editor/latest/userguide/tagging-resources.html) to find and edit tags for your resources and group them in resources groups
- Cost and Usage Reports: a comprehensive & granular set of aws costs and data available, including additonal metadata about services, pricing and reservations. Can be integrated and analysed using Athena, Redshift and QuickSight.
- Cost Explorer: visualize, understand and manage your aws costs and usage over time. Create custom reports to analyze costs and usage at various degree of granularity (monthly, hourly, resource-level). Moreover, you can forecast usage up to 12 months based on previous usage and **helps you choose an optimal saving plans**

### Monitoring against costs
- Billing Alarms: you can create them with the use of the data from Cloud-Watch (region specific), it is used for actual costs not for projected costs.
- Budgets: create budget and send alarms when costs (or forecasts) exceed the budget
  - 3 types of budgest: Usage, Cost, Reservation
  - for Reserverd Instances (RI) it can track utilization
  - Supports up to 5 SNS (Simple Notification Service) notifications per budget
  - Can filter by service, linked account, tag, purchase option, instance type, region, etc.
  - Same options as Cost Explorer
  - 2 budgets are free, then they cost ($0.02/day/budget)

## Trusted Advisor

- It comes out of the box (no need to install anything)
- It represent a tool which makes a high level aws account assesment and offer recommendations.
- Analyzes your aws accounts and provides recommendation on 5 categories *(required by exam)*:
  - **Cost Optimization**
  - **Performance**
  - **Security**
  - **Fault Tolerance**
  - **Service Limits**
- It offer some check based on support plans *(required by exam)*
  -  For Basic & Developer Support Plan you have 7 Core Checks
    -  S3 Bucket Permissions
    -  Security Groups - Specific Ports Unrestricted
    -  IAM Use
    -  MFA on Root Account
    -  EBS Public Snaphsots
    -  RDS Public Snapshots
    -  Service Limits
  -  For Business & Enterprise Support Plan you have Full Checks and you get extra:
    -  Full Checks available on the 5 categories (Cost optimization, perforamnce, fault tolerance, security, service limits)
    -  Ability to set CloudWatch alarms when reaching limits
    -  Programatic Access using AWS Support API
 
 ## Support Plans Pricing for AWS 
 
 *(required by exam)*
 
 - **Basic Support** (free) and you get:
  - Customer Service & Communities - 24x7 access to customer service, documentation, whitepapers and support forums
  - For Trusted Advisor we only get access to 7 core checks and guidance to provision your resources following best practices
  - Personal Health Dashboard
 - **Developer Support**
  - get everything from the Basic Support Plan
  - Business hours email access to Cloud Support Associates
  - Unlimited cases/ 1 primary contact
  - Response times based on case severity (general guidance < 24 business hours, system impaired < 12 business hours)
- **Business Support**
  - intended to be used if you have production workloads
  - Trusted Advisor: full set of checks + api access
  - 24x7 phone, email and chat access to Cloud Support Engineers
  - Unlimited cases/ Unlimited contacts
  - Access to Infrastructure Event Management for additional fee
  - Response times based on case severity (general guidance < 24 business hours, system impaired < 12 business hours, production system impaired < 4 hours, production system down < 1 hour)
- **Enterprise On-Ramp Support** 
  - intended to be used if you have production or business crtical workloads
  - All of Business Suppoort Plan features
  - Access to a pool of technical account managers (TAM)
  - Concierge Support Team (for billing and account best practices)
  - Infrastucture Event Management, Well-Architected & Operations Reviews
  - Response times based on case severity (...same as Business Support, Business critical system down < 30 minutes)
- **Enterprise Support** 
  - intended to be used if you have mission critical workloads
  - All of Businsess Support Plan
  - Access to a designated Technical Account Manager (TAM)
  - ...same things as on Enterprise On-Ramp
  - Response times based on case severity (...same as Business Support, Business critical system down < 15 minutes)

## Exam Tips

- It comes out of the box (no need to install anything)
- It represent a tool which makes a high level aws account assesment and offer recommendations.
- Analyzes your aws accounts and provides recommendation on 5 categories *(required by exam)*:
  - **Cost Optimization**
  - **Performance**
  - **Security**
  - **Fault Tolerance**
  - **Service Limits**
- It offer some check based on support plans *(required by exam)*
  -  For Basic & Developer Support Plan you have 7 Core Checks
    -  S3 Bucket Permissions
    -  Security Groups - Specific Ports Unrestricted
    -  IAM Use
    -  MFA on Root Account
    -  EBS Public Snaphsots
    -  RDS Public Snapshots
    -  Service Limits
  -  For Business & Enterprise Support Plan you have Full Checks and you get extra:
    -  Full Checks available on the 5 categories (Cost optimization, perforamnce, fault tolerance, security, service limits)
    -  Programatic Access using AWS Support API
