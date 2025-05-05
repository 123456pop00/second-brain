# AWS Elastic Beanstalk

## Overview

AWS Elastic Beanstalk is a Platform as a Service (PaaS) that makes it easy to deploy, manage, and scale web applications and services. It handles the provisioning of infrastructure, load balancing, auto-scaling, and application health monitoring.

## Key Features
- Supports multiple programming languages and platforms
- Automated provisioning and management of resources
- Integrated load balancing and auto-scaling
- Application health monitoring and logging
- Customizable environment configuration
- Zero-downtime deployments with rolling updates

## Supported Platforms
- Java, .NET, PHP, Node.js, Python, Ruby, Go, Docker
- Preconfigured and custom platforms

## Architecture
- Environments: Each application runs in one or more environments (web server or worker)
- Environment Tiers: Web server (HTTP/S) or worker (background tasks)
- Environment Resources: EC2, ELB, Auto Scaling, RDS, S3, CloudWatch, IAM

## Deployment
- Supports rolling, rolling with additional batch, immutable, and blue/green deployments
- Application versions managed and stored in S3
- Environment configuration via configuration files (.ebextensions)

## Monitoring & Logging
- Integrated with CloudWatch for metrics and alarms
- Application and environment logs accessible via console or CLI

## Security
- IAM roles for environment resources
- VPC support for network isolation
- HTTPS support with SSL certificates

## Best Practices
- Use environment variables for configuration
- Separate dev, test, and prod environments
- Monitor application and environment health
- Use rolling or immutable deployments for zero downtime
- Secure environments with IAM and VPC

### Components
Elastic Beanstalk has three components:
- Application: collection of Elastic Beanstalk components (environments, versions, configurations, …)
- Application Version: an iteration of your application code
- Environment
	- Collection of AWS resources running an application version (only one application version at a time)
	- Tiers: Web Server Environment Tier & Worker Environment Tier
	- You can create multiple environments (dev, test, prod, …)

## Three architecture models:

- Single instance deployment: great for development and testing purposes
- LB + ASG: great for production or staging web applications=
- ASG only: great for non-web apps in production

## Deployment

- You deploy application versions to environments and can promote application versions to the next environment
- Rollback feature to previous application versions
- Full control over the lifecycle of environments

### Deployment Modes

- Single Instance mode: Great for development environment
- High Availability with Load Balancer mode: Great for production environments

### Deployment Options for Updates

- **All at once (deploy on the go)**
    - Fastest, but instances aren't available to serve traffic for a while (longer downtime)
    - No additional cost
- **Rolling update**
    - Update a few (bucket) instances at a time, and then move onto the next bucket when the current ones become healthy
    - You can set the bucket size
    - Application will run below capacity during update
    - At some point, the application will run both versions simultaneously
    - Can be a very long deployment time depending on number of instances running
    - No additional cost
- **Rolling update with additional batches**
    - Similar to rolling updates but you spin up new instances to move the batch (so the old application is still available)
    - Application is running at capacity
    - You can set the bucket size
    - Additional batches are removed at the end of the deployment
    - Small additional cost (due to additional running instances)
    - Great for production environments
- **Immutable**
    - Spins up new instances in a new ASG, deploys versions to these instances and then swaps all the instances when everything is healthy
    - Zero downtime
    - New code is deployed on new instances in a temporary ASG
    - High cost, double capacity
    - Longest deployment
    - Quick rollback in case of failures (new ASG will be terminated)
    - Best for production environments

### Deployment Mechanism

- Describe dependencies
    - (requirements.txt for python, package.json for node.js)
- Package code as zip
- Zip file is uploaded to each EC2 machine
- Each EC2 machine resolves dependencies (SLOW)
- Optimization in case of long deployments:
    - Package dependencies with source code to improve deployment performance and speed

#### Blue / Green Deployment

- This is not a direct feature of Elastic Beanstalk
- Zero downtime and release facility
- Create a new staging environment and deploy your newest version there
- The new environment (green) can be validated independently and roll back if there's issues
- Route 53 can be setup using weighted policies to redirect a little bit of traffic to the staging environment
- Using the elastic beanstalk console, you can "swap URLs" when with the testing environment
- This is a manual feature, it's not directly embedded in EB

#### Elastic Beanstalk Extensions

- A zip file containing our code must be deployed to Elastic Beanstalk
- All the parameters set in the UI can be configured with code using files
- Requirements:
    - in the .ebextensions/ directory in the root of source code
    - YAML / JSON format
    - .config extensions (example: logging.config)
    - Able to modify some default settings using: option_settings
    - Ability to add resources such as RDS, ElastiCache, DynamoDB, etc...
- Resources managed by .ebextensions get deleted if the environment goes away
- The .ebextensions folder goes to the root of your project

#### Elastic Beanstalk CLI

- We can install an additional CLI called the “EB cli” which makes working with Beanstalk from the CLI easier
- Basic commands are:
    - eb create
    - eb status
    - eb health
    - eb events
    - eb logs
    - eb open
    - eb deploy
    - eb config
    - eb terminate
- It’s helpful for your automated deployment pipelines!