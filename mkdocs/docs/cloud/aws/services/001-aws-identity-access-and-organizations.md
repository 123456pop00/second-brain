# Identity Access Management (IAM) & Advanced Identity & Organizations

## Overview

IAM is a global AWS service that allows you to securely control access to AWS services and resources for your users. It enables you to create and manage AWS users and groups, and use permissions to allow and deny their access to AWS resources.

## 1. IAM

### Capabilities
- Create users and groups
- Assign policies to users and groups
- Policies define permissions
- Follow the least privilege principle

### Policies
- JSON documents defining permissions
- Can be assigned to users, groups, or roles
- Structure: Version, ID, Statement (Sid, Effect, Principal, Action, Resource, Condition)
- Policy variables allow for reusable policies

### Roles
- Allow AWS services to perform actions on your behalf
- Use trust policies to define which entities can assume the role

### Security Tools
1. IAM Credentials Report: list all your account's users and the status of their various credentials
2. IAM Access Analyzer: inspects unused access to guide you toward least privilege

### Best Practices
- Don't use root account except for setup
- One physical user = one AWS user
- Assign users to groups and assign permissions to groups
- Create a strong password policy
- Use and enforce MFA
- Create and use roles for giving permissions to AWS services
- User access keys for programmatic access (CLI/SDK)
- Never share IAM users or access keys

### Shared Responsibility Model for IAM
- AWS: Infrastructure, configuration, compliance
- You: Manage groups, roles, policies, users, MFA, key rotation, permissions

## 2. Security Token Service (STS)

- Create temporary, limited-privileges credentials for AWS resources
- Use cases: EC2 roles, cross/same account access, identity federation

## 3. AWS Directory Service

- Connect to Microsoft Active Directory (AD)
- Options: AWS Managed Microsoft AD, AD Connector, Simple AD

## 4. AWS IAM Identity Center (Single Sign-On)

- Single login for AWS accounts and business cloud applications
- Supports SAML2.0-enabled applications
- User data can be stored in AWS or third-party providers

## 5. Organizations

- Manage multiple AWS accounts
- Master account for consolidated billing
- Benefits: single bill, volume discounts, reserved instance pooling, API automation, Service Control Policies (SCP)

### Multi-Account Strategies
- Create accounts per group, department, or environment
- Use tagging for billing
- Enable CloudTrail and CloudWatch Logs centrally

### Service Control Policies (SCP)
- Whitelist/blacklist IAM actions at OU or account level
- Not applied to master account
- Must have explicit Allow

### Hierarchy Example
```
 Root OU
     - Master Account
        Prod OU
            - Account A
                HR OU
                    - Account B
                Finance OU
                    - Account C
```

### Access Control List (ACL)
- Control which principals in another account can access a resource
- Used by S3, WAF, VPC

### Permissions Boundary
- Managed policy to set maximum permissions for IAM entities

### Consolidated Billing
- Combine usage for volume pricing and discounts
- One bill for all accounts

### AWS Control Tower
- Set up and govern secure, compliant multi-account AWS environments
- Automate setup, policy management, and compliance monitoring




