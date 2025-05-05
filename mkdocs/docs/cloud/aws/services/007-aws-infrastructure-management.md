# AWS Infrastructure Management

## Overview

AWS provides a suite of tools and services to help you manage, monitor, and automate your cloud infrastructure efficiently and securely.

## Infrastructure as Code (IaC)

### AWS CloudFormation
- Declarative templates for provisioning AWS resources
- Supports version control and automation
- Enables repeatable infrastructure deployments

### AWS CDK (Cloud Development Kit)
- Define cloud infrastructure using familiar programming languages
- High-level abstractions and constructs
- Synthesizes to CloudFormation templates

### AWS OpsWorks
- Configuration management using Chef and Puppet
- Automates server configuration, deployment, and management

## Monitoring & Management

### AWS CloudWatch
- Monitoring for AWS resources and applications
- Collects and tracks metrics, logs, and events
- Set alarms and automate actions

### AWS CloudTrail
- Records AWS API calls for your account
- Provides event history for auditing and compliance

### AWS Config
- Tracks resource configurations and changes
- Enables compliance auditing and security analysis

### AWS Systems Manager
- Unified interface for managing AWS resources
- Automation, patching, inventory, and parameter store

## Automation & Orchestration

### AWS Elastic Beanstalk
- Platform as a Service for deploying applications
- Handles provisioning, load balancing, scaling, and monitoring

### AWS CodeDeploy
- Automates code deployments to EC2, Lambda, and on-premises
- Supports blue/green and rolling deployments

### AWS CodePipeline
- Continuous integration and delivery service
- Automates build, test, and deploy phases

## Best Practices
- Use infrastructure as code for repeatability and automation
- Monitor resources and set up alerts
- Track changes and maintain audit trails
- Automate deployments and management tasks
- Enforce compliance and security policies

## Summary

### Deployment Services

- CloudFormation: (AWS only)
  - Infrastructure as Code, works with almost all of AWS resources
  - Repeat across Regions & Accounts
- Beanstalk: (AWS only)
  - Platform as a Service (PaaS), limited to certain programming languages or Docker
  - Deploy code consistently with a known architecture: ex, ALB + EC2 + RDS
- CodeDeploy (hybrid): deploy & upgrade any application onto servers
- Systems Manager (hybrid): patch, configure and run commands at scale
- OpsWorks (hybrid): managed Chef and Puppet in AWS

### Developer Services 

- CodeCommit: Store code in private git repository (version controlled)
- CodeBuild: Build & test code in AWS
- CodeDeploy: Deploy code onto servers
- CodePipeline: Orchestration of pipeline (from code to build to deploy)
- CodeArtifact: Store software packages / dependencies on AWS
- CodeStar: Unified view for allowing developers to do CICD and code
- Cloud9: Cloud IDE (Integrated Development Environment) with collab
- AWS CDK: Define your cloud infrastructure using a programming language

## CloudFormation

Represents a declarative way of outlining your AWS Infrastructure for any resources thus allowing you to create in the right order the exact configuration you specify.
This is Infrastructure as Code allowing you:
- greater degree of control
- you can estimate costs of your resources using CloudFormation Template or through using tags or saving strategies (delete resource at 5pm)
- you are more productive being able to destroy and re-create your infrastructure on the fly
- you can leverage already exiting templates

### CDK (Cloud Development Kit)

This is a set o libraries allowing you to define your cloud infrastructure using a programming language (python, typescript, java, .net) and compiling into CloudFormation template (json/yaml)

## Elastic Beanstalk

Is a developer centric view of deploying an application on AWS (using AWS components like EC2, ASG, ELB, RDS, etc..) with full control over the configuration. A managed service where just the application code is responsabile of the developer the rest is handled by Beanstalk:
- Instance configuration / OS is handled by Beanstalk
- Deployment strategy is configurable but performed by Elastic Beanstalk
- Capacity Provision
- Load balancing & auto-scaling
- Application healh-monitoring & responsiveness

Beanstalk = Platform as a Service (Paas).

Beanstalk is free but you pay for the underlying instances and you have three architecture models:
- Single Instance deployment (good for dev)
- LB + ASG: great for production or pre-prod web app
- ASG only: great for non-web apps in prod

## Code* Services

### CodeDeploy

Help with the deplyoment of an application, working in a **hybrid** manner both with EC2 instances and On-premises servers (provisioned and configured ahead of time with CodeDeploy Agent).

### CodeCommit

An AWS Github alternative for storing code in a repository using Git.

### CodeBuild

Code building service which helps compile source code, run tests and produces packages ready for deployment. Pay-as-you-go pricing and fully managed serverless.

### CodePipeline

Helps orchestrate different stepts to have the code automatically pushed to production. It's compatible with the Code* Services (CodeCommit, CodeBuild, CodeDeploy, CloudFormation and ElastiBeanstalk) and with other 3rd-party services (e.g.: Github).

### CodeArtifact

Its an artifact management system by AWS allowing for dependencies (npm, gradle, maven, yarn, twine, etc.).

### CodeStar

An unified UI services to manage software developement activites in one place and allow quick-way start for setup of all Code* services.

## Cloud9

A cloud-based IDE offered by AWS with real-time code collaboartion feature.

## SSM (Systems Manager)

A hybrid aws services which helps you manage EC2 and On-premises instance through it. It need to install SSM agent on the machine and will allow you to run commands safely through it (no ssh access, bastion hosts or port 22 needed for access).

## OpsWork

It's a servrices which allow you to manage Chef & Puppet infrastructure services on EC2 and On-premises VM (as an alternative to AWS SSM).
