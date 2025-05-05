# AWS Cloud Integration

## Overview

AWS provides a variety of services and tools to integrate applications, data, and workflows across cloud and on-premises environments. These services enable seamless communication, data transfer, and event-driven architectures.

## Messaging & Queuing

### Amazon SQS (Simple Queue Service)
- Fully managed message queuing service
- Decouples and scales microservices, distributed systems, and serverless applications
- Supports standard and FIFO queues

### Amazon SNS (Simple Notification Service)
- Fully managed pub/sub messaging service
- Supports application-to-application and application-to-person notifications
- Integrates with Lambda, SQS, HTTP/S endpoints, email, SMS, and mobile push

### Amazon MQ
- Managed message broker service for Apache ActiveMQ and RabbitMQ
- Supports industry-standard APIs and protocols

## Event-Driven Integration

### Amazon EventBridge (formerly CloudWatch Events)
- Serverless event bus for application integration
- Ingests, filters, and routes events from AWS services, SaaS apps, and custom sources
- Enables event-driven architectures

## Data Integration

### AWS DataSync
- Automates and accelerates data transfer between on-premises storage and AWS
- Supports NFS, SMB, Amazon S3, Amazon EFS, and Amazon FSx

### AWS Glue
- Serverless data integration service
- Prepares and transforms data for analytics and machine learning
- Supports ETL (extract, transform, load) workflows

### AWS Transfer Family
- Managed file transfer service for SFTP, FTPS, and FTP
- Integrates with Amazon S3 and EFS

## API Integration

### Amazon API Gateway
- Fully managed service for creating, publishing, maintaining, monitoring, and securing APIs
- Supports RESTful and WebSocket APIs
- Integrates with Lambda, EC2, and other AWS services

## Hybrid Integration

### AWS Direct Connect
- Dedicated network connection from on-premises to AWS
- Provides consistent, low-latency performance

### AWS VPN
- Securely connects on-premises networks to AWS VPCs
- Supports site-to-site and client VPN connections

## Best Practices
- Use managed services for scalability and reliability
- Decouple components with messaging and event-driven patterns
- Secure integrations with IAM, encryption, and network controls
- Monitor and audit integration points
