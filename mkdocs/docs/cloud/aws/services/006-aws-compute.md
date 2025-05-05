# AWS Compute Services

## Overview

AWS provides a variety of compute services to support different workloads, including virtual machines, containers, serverless, and edge computing.

## EC2 (Elastic Compute Cloud)
- Virtual servers in the cloud
- Wide selection of instance types
- Full control over OS and software
- Supports auto scaling and load balancing

## Lambda
- Serverless compute service
- Runs code in response to events
- Automatic scaling and resource management
- Pay only for compute time consumed

## Elastic Beanstalk
- Platform as a Service (PaaS)
- Deploy and manage applications easily
- Supports multiple languages and platforms
- Handles provisioning, load balancing, scaling, and monitoring

## ECS (Elastic Container Service)
- Highly scalable container orchestration service
- Supports Docker containers
- Integrates with EC2 and Fargate

## EKS (Elastic Kubernetes Service)
- Managed Kubernetes service
- Run Kubernetes clusters on AWS
- Handles control plane management and scaling

## AWS Fargate
- Serverless compute engine for containers
- Works with ECS and EKS
- No need to manage servers or clusters

## Lightsail
- Simplified cloud platform
- Easy-to-use virtual private servers
- Bundled resources (compute, storage, networking)
- Ideal for simple web apps, blogs, and dev/test environments

## Outposts
- Run AWS infrastructure and services on-premises
- Hybrid cloud solution
- Consistent APIs and tools across cloud and on-premises

## Batch
- Run batch computing workloads
- Dynamically provisions compute resources
- Supports job queues and dependencies

## Edge Computing
- AWS Wavelength: Brings AWS services to the edge of 5G networks
- AWS Snow Family: Edge computing and data transfer devices
- AWS Greengrass: Local compute, messaging, data caching, sync, and ML inference

## Best Practices
- Choose the right compute service for your workload
- Use auto scaling for elasticity
- Monitor and optimize resource usage
- Secure compute resources with IAM and network controls
- Automate deployments and management with infrastructure as code
