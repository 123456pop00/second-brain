# AWS Fargate Compute

## Overview

AWS Fargate is a serverless compute engine for containers that works with both Amazon Elastic Container Service (ECS) and Amazon Elastic Kubernetes Service (EKS). It allows you to run containers without managing servers or clusters.

## Key Features
- Serverless compute for containers
- Works with ECS and EKS
- No server or cluster management
- Automatic scaling and resource provisioning
- Integrated with AWS networking and security
- Pay only for resources used

## Architecture
- Launch containers directly without provisioning EC2 instances
- Define CPU and memory at the task or pod level
- Fargate provisions and manages the infrastructure

## Security
- IAM roles for tasks and pods
- VPC integration for network isolation
- Encryption at rest and in transit
- Security groups and network policies

## Monitoring & Logging
- Integrated with CloudWatch for metrics and logs
- Container-level monitoring and logging

## Best Practices
- Use IAM roles for least privilege
- Monitor resource usage and set up alerts
- Use VPC and security groups for isolation
- Optimize task and pod definitions for cost and performance

