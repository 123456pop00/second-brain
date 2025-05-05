# AWS Code Services

## Overview

AWS provides a suite of developer tools to help you build, test, and deploy your code quickly and securely. These services support continuous integration and continuous delivery (CI/CD) workflows.

## Key Services

### AWS CodeCommit
- Managed source control service that hosts private Git repositories
- Secure, scalable, and highly available
- Supports code collaboration and version control

### AWS CodeBuild
- Fully managed build service
- Compiles source code, runs tests, and produces deployable artifacts
- Scales automatically and integrates with other AWS services

### AWS CodeDeploy
- Automates code deployments to EC2, Lambda, and on-premises servers
- Supports blue/green and rolling deployments
- Tracks deployment health and rollback

### AWS CodePipeline
- Continuous integration and delivery service
- Automates build, test, and deploy phases
- Integrates with CodeCommit, CodeBuild, CodeDeploy, and third-party tools

### AWS CodeArtifact
- Artifact repository for software packages
- Supports npm, Maven, PyPI, and NuGet
- Secure and scalable package management

### AWS CodeStar
- Unified interface for managing software development activities
- Integrates with Code* services and third-party tools
- Provides project templates and dashboards

## Best Practices
- Use managed services for scalability and reliability
- Automate build, test, and deployment workflows
- Monitor pipeline health and set up alerts
- Secure code repositories and artifacts with IAM and encryption
- Use version control and branching strategies

# Code Build

- Fully managed build service
- Alternative to other build tools such as Jenkins
- Continuous scaling (no servers to manage or provision – no build queue)
- Pay for usage: the time it takes to complete the builds
- Leverages Docker under the hood for reproducible builds
- Possibility to extend capabilities leveraging our own base Docker images
- Secure: Integration with KMS for encryption of build artifacts, IAM for build permissions, and VPC for network security, CloudTrail for API calls logging
### Overview
- Source Code from GitHub / CodeCommit / CodePipeline / S3...
- Build instructions can be defined in code
    - buildspec.yml file
- Output logs to Amazon S3 & AWS CloudWatch Logs
- Metrics to monitor CodeBuild statistics
- Use CloudWatch Events to detect failed builds and trigger notifications - Use CloudWatch Alarms to notify if you need “thresholds” for failures
- CloudWatch Events / AWS Lambda as a Glue
- SNS notifications
- Ability to reproduce CodeBuild locally to troubleshoot in case of errors
- Pipelines can be defined within CodePipeline or CodeBuild itself
- Supported Environments
    - Java
    - Ruby
    - Python
    - Go
    - Node.js
    - Android
    - .NET Core
    - PHP
    - Docker : extend any environment you like
- Local Build
	- In case of need of deep troubleshooting beyond logs...
	- You can run CodeBuild locally on your desktop (after installing Docker) - For this, leverage the [CodeBuild Agent](https://docs.aws.amazon.com/codebuild/latest/userguide/use-codebuild-agent.html)

### Working Mode

- Two ways to run CodeBuild
    - Source Code
        - buildspec.yml
    - By building a Docker image
        - AWS Managed or Custom
- A CodeBuild Container is created
- You can add an optional S3 Cache bucket
    - Cache while you do multiple builds
        - dependencies
        - artifacts
- Output to an S3 bucket
- Save logs using CloudWatch or S3
### BuildSpec File

- buildspec.yml file must be at the root of your code
- Define environment variables:
    - Plaintext variables
    - Secure secrets: use SSM Parameter store
- Phases (specify commands to run):
    - Install: install dependencies you may need for your build
    - Pre build: final commands to execute before build
    - Build: actual build commands
    - Post build: finishing touches (zip output for example)
- Artifacts: What to upload to S3 (encrypted with KMS)
- Cache: Files to cache (usually dependencies) to S3 for future build speedup
# Code Deploy

- Deploy your application automatically to EC2 instances, On-premise servers, lambda functions, ECS services, etc
- A file named appspec.yml defines how the deployment happens
- Gradual deployment control
- These instances are not managed by Elastic Beanstalk
- There are several ways to handle deployments using open source tools (Ansible, Terraform, Chef, Puppet, etc...)
    - CodeDeploy is the alternative to these tools
### Working Mode

- Each EC2 Machine (or On Premise machine) must be running the CodeDeploy Agent
- The agent is continuously polling AWS CodeDeploy for work to do
- CodeDeploy sends appspec.yml file.
- Application is pulled from GitHub or S3
- EC2 will run the deployment instructions
- CodeDeploy Agent will report of success / failure of deployment on the instance

**Additional information**
- EC2 instances are grouped by deployment group (dev / test / prod)
- Lots of flexibility to define any kind of deployments
- CodeDeploy can be chained into CodePipeline and use artifacts from there
- CodeDeploy can re-use existing setup tools, works with any application, auto-scaling integration
- Note: Blue / Green only works with EC2 instances (not on premise)
- Support for AWS Lambda deployments
- CodeDeploy does not provision resources

### Primary Components

- Application: unique name
- Compute platform: EC2/On-Premise or Lambda
- Deployment configuration: Deployment rules for success / failures
    - EC2/On-Premise: you can specify the minimum number of healthy instances for the deployment.
    - AWS Lambda: specify how traffic is routed to your updated Lambda function versions.
- Deployment group: group of tagged instances (allows to deploy gradually)
- Deployment type: In-place deployment or Blue/green deployment:
- IAM instance profile: need to give EC2 the permissions to pull from S3 / GitHub
- Application Revision: application code + appspec.yml file
- Service role: Role for CodeDeploy to perform what it needs
- Target revision: Target deployment application version

### AppSpec File

The AppSpec File is used to define the parameters that will be used for a CodeDeploy deployment. The file structure depends on whether you are deploying to Lambda or EC2 / On Premises.
- File section: how to source and copy from S3 / GitHub to filesystem
- Hooks: set of instructions to do to deploy the new version (hooks can have timeouts).The order is:
    - Traffic Blocking Hooks
	    - BeforeBlockTraffic: Run tasks on instances before they are deregistered from a load balancer.
	    - BlockTraffic: Deregister instances from a load balancer
	    - AfterBlockTraffic: Run tasks on instances after they are Deregistered from a load balancer.
    - ApplicationStop: Gracefully stop the application in preparation for deploying the new revision
    - DownloadBundle: The CodeDeploy agent copies the application revision files to a temporary location.
    - BeforeInstall: Details of any pre-installation scripts, e.g. backing up the current version, decrypting files.
    - Install: The CodeDeploy agent copies the application revision files from their temporary location to their correct location
    - AfterInstall: Details of any post-installation scripts (e.g. configuration tasks, change file permissions, etc.)
    - ApplicationStart: Restarts any services that were stopped during ApplicationStop.
    - **ValidateService**: Details of any tests to validate the service.
    - Traffic Allowances Hooks
	    - BeforeAllowTraffic: Run tasks on instances before they are registered with a load balancer.
	    - AllowTraffic: Register instances with a load balancer.
	    - AfterAllowTraffic: Run tasks on instances after they are registered with a load balancer.

## Deployment

### Deployment Config

- Configs:
    - One a time: one instance at a time, one instance fails => deployment stops
    - Half at a time: 50%
    - All at once: quick but no healthy host, downtime. Good for dev
    - Custom: min healthy host = 75%
- Failures:
    - Instances stay in “failed state”
    - New deployments will first be deployed to “failed state” instances
    - To rollback: redeploy old deployment or enable automated rollback for failures
- Deployment Targets:
    - Set of EC2 instances with tags
    - Directly to an ASG
    - Mix of ASG / Tags, so you can build deployment segments
    - Customization in scripts with DEPLOYMENT_GROUP_NAME environment variables
### Deployment Types

- In place deployment
    - half the time
- Blue / Green Deployment
    - Attached to one auto-scaling group of instances
    - new auto-scaling group of instances created (green)
    - if it passes the health checks, version 1 (original asg) is deleted (blue)
#### Lambda & ECS
- Can help traffic shift for AWS Lambda and deployment of new task definition for ECS 
- only with Blue/Green deployment
**Traffic Shifting Options:**
- Linear: grow traffic every N minutes until 100%
- Canary: try X percent then 100%
- AllAtOnce: immediate
### Redeploy and Rollbacks

- Rollback = redeploy a previously deployed revision of your application
- Deployments can be rolled back:
	- Automatically – rollback when a deployment fails or rollback when a CloudWatch Alarm thresholds are met
	- Manually
- Disable Rollbacks — do not perform rollbacks for this deployment
- If a roll back happens, CodeDeploy redeploys the last known good revision as a new deployment
# Code Pipeline

AWS CodePipeline is a fully managed Continuous Integration and Continuous Delivery service.
CodePipeline allows you to model your release process as a workflow or pipeline made up of different tasks, such as the simple workflow represented below:
Code Update -> Build -> Test -> Deploy

**Notes:**
- Continuous delivery
- Visual workflow
- Source: GitHub, CodeCommit, Amazon S3
- Build: CodeBuild, Jenkins, etc...
- Load Testing: 3rd par ty tools
- Deploy: AWS CodeDeploy, Beanstalk, CloudFormation, ECS...
- Made of stages:
    - Each stage can have sequential actions and / or parallel actions
    - Stages examples: Build, Test, Deploy, Load Test, etc...
    - Manual approval can be defined at any stage
##  Artifacts

- Each pipeline stage can create ”artifacts”
- **Artifacts** are Amazon S3 buckets that CodePipeline uses to store artifacts used by pipelines. When you first use the CodePipeline console in a region to create a pipeline, CodePipeline automatically generates this S3 bucket in the AWS region.
## Troubleshooting

- CodePipeline state changes happen in **AWS CloudWatch Events**, which can in return create SNS notifications.
- Ex: you can create events for failed pipelines • Ex: you can create events for cancelled stages
- If CodePipeline fails a stage, your pipeline stops, and you can get information in the console
- AWS CloudTrail can be used to audit AWS API calls
- If Pipeline can’t perform an action, make sure the “IAM Service Role” attached does have enough permissions (IAM Policy)
- Make sure to have Versions enabled in the S3 bucket
# Code Commit

Code Commit is a fully managed source control service that enables companies to host secure and highly scalable private Git repositories

**Notes:**
- **Version Control** is the ability to understand changes that happened to the code over time (and possibly roll back)
- This is enabled by using a version control system such as Git
- A git repository can live on your machine or on a central online repository
- Benefits:
    - Collaborate with a team of developers
    - Make sure the code is backed-up somewhere
    - Makes sure it's fully viewable and auditable
- AWS CodeCommit
    - Private git repositories
    - No size limits on the repositories (scale seamlessly)
    - Fully managed and highly available
    - The code is only in your AWS cloud account
    - Increased security and compliance
    - Secure (encrypted access control, etc)
- CodeCommit Security
    - Interactions are done using git
    - Authentication with Git
        - SSH Keys: AWS Users can configure SSH keys in their IAM Console
        - HTTPS: Done through AWS CLI Authentication helper or generate HTTPS credentials
        - MFA: Multi-Factor Authentication
    - Authorization with Git
        - IAM Policies manage user / roles rights to the repositories
    - Encryption
        - Repositories are automatically encrypted at rest using KMS
        - Encrypted in transit (can only user HTTPS or SSH both secure)
    - Cross Account access:
        - Do not share your SSH keys
        - Do not share your AWS credentials
        - Use IAM Role in your AWS account and use AWS STS (with AssumeRole API)
### Notifications

- You can trigger notifications in CodeCommit using AWS SNS(Simple Notification Service) or AWS Lambda or AWS CloudWatch Event Rules
- Use cases for notifications SNS / AWS Lambda notifications:
	- Deletion of branches
	- Trigger for pushes that happens in master branch
	- Notify external Build System
	- Trigger AWS Lambda function to perform codebase analysis (maybe credentials got committed in the code?)
- Use cases for CloudWatch Event Rules:
	- Trigger for pull request updates (created / updated / deleted / commented)
	- Commit comment events
	- CloudWatch Event Rules goes into an SNS topic

## Exam Tips

- What are the MINIMUM properties required in the 'resources' section of the AppSpec file for CodeDeploy to deploy the function successfully?
	- name, alias, currentversion, and targetversion