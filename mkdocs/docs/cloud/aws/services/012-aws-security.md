# AWS Security

## Overview

AWS provides a comprehensive set of security services and features to help you protect your data, accounts, and workloads from unauthorized access and threats.

## Shared Responsibility Model

- AWS is responsible for security **of** the cloud (hardware, software, networking, and facilities)
- You are responsible for security **in** the cloud (data, identity, applications, OS, network & firewall configuration)

## Identity & Access Management

### AWS IAM

- Manage users, groups, roles, and permissions
- Enforce least privilege access
- Use IAM policies for fine-grained control

### AWS Organizations & SCPs

- Manage multiple AWS accounts
- Apply Service Control Policies (SCPs) for account-level restrictions

### AWS SSO (Single Sign-On)

- Centralized access to multiple AWS accounts and business applications

## Data Protection

### Encryption

- Encrypt data at rest (S3, EBS, RDS, DynamoDB, etc.)
- Encrypt data in transit (SSL/TLS)
- Use AWS KMS (Key Management Service) for key management
- Use CloudHSM for dedicated hardware security modules

### Backup & Recovery

- Use AWS Backup for centralized backup management
- Enable automated backups for databases and storage
- Implement disaster recovery strategies

## Network Security

### Security Groups & NACLs

- Security Groups: virtual firewalls for instances (stateful)
- Network ACLs: control traffic at the subnet level (stateless)

### VPC Endpoints & PrivateLink

- Private connectivity to AWS services
- Reduce exposure to the public internet

### DDoS Protection

- AWS Shield: managed DDoS protection
- AWS WAF: web application firewall for HTTP/HTTPS

## Monitoring & Compliance

### AWS CloudTrail

- Records API calls for auditing
- Detects unusual activity

### AWS Config

- Tracks resource configurations and changes
- Enables compliance auditing

### AWS Security Hub

- Centralized security and compliance management
- Aggregates findings from multiple AWS services

### Amazon GuardDuty

- Threat detection and continuous security monitoring
- Uses machine learning, anomaly detection, and integrated threat intelligence

### AWS Inspector

- Automated security assessment service
- Helps improve security and compliance of applications

## Best Practices

- Enable MFA for all users
- Use IAM roles instead of root credentials
- Regularly rotate credentials and keys
- Encrypt sensitive data at rest and in transit
- Monitor and audit account activity
- Apply least privilege principle
- Use security automation and alerts

## Summary

- [Shared Responsibility on AWS](https://aws.amazon.com/compliance/shared-responsibility-model/)
- Shield: Automatic DDoS Protection + 24/7 support for advanced
- WAF: Firewall to filter incoming requests based on rules
- KMS: Encryption keys managed by AWS
- CloudHSM: Hardware encryption, we manage encryption keys
- AWS Certificate Manager: provision, manage, and deploy SSL/TLS Certificates
- Artifact: Get access to compliance reports such as PCI, ISO, etc…
- GuardDuty: Find malicious behavior with VPC, DNS & CloudTrail Logs
- Inspector: For EC2 only, install agent and find vulnerabilities
- Config: Track config changes and compliance against rules
- Macie: Find sensitive data (ex: PII data) in Amazon S3 buckets
- CloudTrail: Track API calls made by users within account
- AWS Security Hub: gather security findings from multiple AWS accounts
- Amazon Detective: find the root cause of security issues or suspicious activities
- AWS Abuse: Report AWS resources used for abusive or illegal purposes
- Root user privileges:
  - Change account settings
  - Close your AWS account
  - Change or cancel your AWS Support plan
  - Register as a seller in the Reserved Instance Marketplace

## DDOS Protection on AWS

- AWS Shield Standard = protects against DDOS attack for your website and applications for all customers at no additonal costs
- AWS Shield Advanced = 24/7 premium DDOS protection
- AWS WAF = filter specific request based on rules
- CloudFront and Route53 = availability protection using global edge network, and combined with AWS Shield provides attack mitigation at the edge

## AWS Shield

Represent a protection from various attack such as SYN/UDP Floods, Reflection Attacks and other layer 3/4 attacks. It is of 2 types:
- Standard = available for all customers for free
- Advance = optional ddos mitigation service (3000$ per month per organization), protect against more sophisticated attack on various services, 24/7 response team, protect against higher fees during usage spike due to DDOS

## AWS WAF (Web Application Firewall)

Protects your web application from common web exploits (layer 7 (HTTP)) being deployed to Application Load Balancer, API Gateway, CloudFront.
This is done by defining Web ACL (Web Access Control List):
- Rules can include IP addresses, HTTP Headers, HTTP body or URI strings
- Protects from common attacks: SQL injection and Cross-Site Scripting
- Size constraints, geo-match (block countries)
- Rate-based rules (to count occurences of events) - DDOS protection

## Pentration Testing

**Note**: AWS customer customer can carry out penetration testing **without prior approval** for 8 services:
- EC2, NAT Gateways and ELB
- RDS
- CloudFront
- Aurora
- API Gateways
- Lambda and Lambda Edge
- Lightsail resources
- Elastic Beanstalk Environments

But there are prohibited activites:
- DNS zone walking via Amazon Route 53 Hosted Zones
- Denial of Service
- Port flooding, protocol flooding, request flooding

## Key Management Service (KMS)

A service which manages encryption keys.

**Opt-In** Services:
- EBS volumes: encrypt volumes
- S3 Buckets: server-side encryption of objects
- Redshift Database: encrypt data
- RDS database: encrypt data
- EFS drives: encrypt data

**Automatically Enabled** Services:
- CloudTrail Logs
- S3 Glacier
- Storage Gateway

## CloudHSM

Provision encryption hardware through a dedicated HSM (Hardware Security Module) allowing you to manage your own encryption keys entirely.

### Customer Master Keys (CMK)

- Customer Managed CMK
  - Create, manage and used by the customer (can enable or disable)
  - Possibility of rotation policy
  - Possibility of bring-you-own-key
- AWS managed CMK
  - Created, managed and used on the customers behalf by AWS
  - Used by AWS services (s3,ebs,redshift)
- AWS owned CMK
  - Collection of CMK that an AWS service owns and manages to use in multiple accounts
  - Used to protect resources in you account
  - You can't view the keys
- CloudHSM Keys (custom keystore)
  - Key generated from you own CloudHSM hardware device
  - Cryptographic operation are perfomed within the CloudHSM cluster

## AWS Certificate Manager (ACM)

Let's you provision, manage and deploy SSL/TLS certificates (public and private) in order to provide HTTPS with automatic TLS certificate renewal on ELB, CloudFront, API gateway.

## AWS Secrets Manager

Meant for storing secrets with capability to force rotation of secrets (which are encrypted using KMS).

## AWS Artifact

Not a service, but a portal that provides customer with on-demand access to AWS compliance documentation and AWS agreements

- Artifacts Reports: AWS ISO certifications, Payment Card Industry (PCI), and System and Organization Control (SOC) reports
- Artifact Agreements: Business Associate Addendum (BAA) or the Health Insurance Portability and Accountability Act (HIPAA)

## GuardDuty

Inteligent Threat Discovery to protect your AWS account that uses ML algorithms, anomaly detection and 3rd party data. Based on input data (cloudtrail event logs, vpc flow logs, dns logs) you can setup Event Bridge rules to be notified in case of findings

## Amazon Inspector

Automated Security Assessments for:
- EC2 Instances: leverages SSM to analyze uninteded network accessibility and the running OS agains known vulnerabilities
- Container Images pushed to ECR
- Lambda Functions: identifies software vulnerability (code + package dependencies)

Reporting & Integration with AWS Security Gub and can send finding to Event Bridge.

## AWS Config

Helps with auditing and recording compliance of your AWS resources by recording configuration and changes over time with the possibility of receiving alerts for any changes.

Questions that can be solved by AWS Config:
- Is there unrestricted SSH access to my security groups?
- Do my buckets have any public access?
- How has my ALB configuration changed over time?

## AWS Macie

Fully managed data security and privacy service that uses machine learning and pattern matching to discover and protect sensitive data in AWS (such as PII).

## Security Hub

Central Security Tool to manage security across several AWS accounts and automate security checks. It has the following:
- Integrated dashboards showing current security and compliance status
- Automatically aggregates alerts in predifned or personal findings format from various services (GuardDuty, Inspector, Macie, IAM access analyzer)
- Must be enabled in the AWS Config Service

## Amazon Detective

Analyzes, investigates and quickly identifies the root cause of security issues or suspicious activites (using ML and graphs) by automatically collecting and processing events from VPC FLow Logs, CloudTrail, GuardDuty and creating a unified view. Used when you need to quickly identify a security risk.

## AWS Abuse

USed to report suspected AWS resources for abusive or illegal purposes (spam, port scanning, DoS or DDos, intrusion attempts, hosting objectional content, malware)
