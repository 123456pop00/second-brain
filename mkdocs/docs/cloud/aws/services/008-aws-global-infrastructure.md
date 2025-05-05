# AWS Global Infrastructure

## Overview

AWS provides a global infrastructure to deliver cloud services with high availability, scalability, and reliability. The infrastructure is designed to support workloads worldwide and meet compliance requirements.

## Key Components

### Regions
- Geographically isolated areas
- Each region consists of multiple, isolated, and physically separate Availability Zones
- Customers choose regions to optimize latency, minimize costs, or address regulatory requirements

### Availability Zones (AZs)
- One or more discrete data centers with redundant power, networking, and connectivity
- Each AZ is physically separated by a meaningful distance from other AZs in the same region
- Designed for high availability and fault tolerance

### Edge Locations
- Used by AWS CloudFront and other services to cache content closer to users
- Improve latency and performance for end users

### Local Zones
- Extend AWS infrastructure to locations closer to large population, industry, and IT centers
- Run latency-sensitive applications closer to end users

### Wavelength Zones
- Bring AWS services to the edge of 5G networks
- Minimize latency to mobile and connected devices

## Networking

### Global Accelerator
- Improves availability and performance of applications with global users
- Uses the AWS global network to route traffic to optimal endpoints

### Direct Connect
- Dedicated network connection from on-premises to AWS
- Provides consistent, low-latency performance

## Security & Compliance
- Data centers are built to meet rigorous security standards
- Compliance certifications for global and industry-specific requirements
- Customers retain control and ownership of their data

## Best Practices
- Choose regions and AZs based on latency, compliance, and cost
- Use multiple AZs for high availability
- Leverage edge locations for content delivery
- Monitor and plan for service limits in each region

## Summary

### Global Applications in AWS - Summary
- Global DNS: Route 53
  - Great to route users to the closest deployment with least latency
  - Great for disaster recovery strategies
- Global Content Delivery Network (CDN): CloudFront
  - Replicate part of your application to AWS Edge Locations – decrease latency
  - Cache common requests – improved user experience and decreased latency
- S3 Transfer Acceleration
  - Accelerate global uploads & downloads into Amazon S3
- AWS Global Accelerator
  - Improve global application availability and performance using the AWS global network
- AWS Outposts
  - Deploy Outposts Racks in your own Data Centers to extend AWS services
- AWS WaveLength
  - Brings AWS services to the edge of the 5G networks
  - Ultra-low latency applications
- AWS Local Zones
  - Bring AWS resources (compute, database, storage, …) closer to your users
  -  Good for latency-sensitive applications

## Global Application in AWS

### Global DNS: Route 53

A managed DNS (Domain Name System = a collection of rules and records which help clients understand how to reach a server through URLs) offered by AWS.
There are several **Routing Policies** offered:
- Simple Routing Policy (no health checks)
- Weighted Routing Policy (route based on a weight on how much traffic should go somewhere)
- Latency Routing Policy (based on user location)
- Failover Routing Policy (with a healthcheck)

### Global Content Delivery Network (CDN): CloudFront

A content delivery network (CDN) offered by AWS which will offer an increased read performance with content cached at the edge. It has included a DDOS protection due to its integration with Shield and AWS Web Application Firewall.
Used in corellation with S3 for distributing files (or static websites) and can be used as an ingress (for uploading files).

#### Cloudfront vs S3 Cross Region Replication

Basically Cloudfront is great for static content with limited setup vs Cross Region replication which is great for dynamic content and which requires some setup.

### S3 Transfer Acceleration

A service to increase transfer speed of file upload by transfering to an AWS edge location which will later forward it to a S3 bucket in the target region.

### AWS Global Accelerator

It helps improve global application **availability** and **performance** using the AWS global network. Basically it uses aws internal network to optimize the route to your application:
- 2 anycast IP are created for you application and traffic is sent through edge locations

As a comparison against CloudFront the AWS Global Accelerator is just proxying packets and improves performance for TCP or UDP (good for HTTP use cases that requried static IP addresses or deterministic fast regional failover)

### AWS Outposts

Its intended for the Hybrid Cloud business (cloud + on premise infrastructure) by providing "server racks" that offers the same AWS functionality as cloud-based services. This is done by having AWS setup and manage "Outposts racks" withing your on-premise infrastructure (you will be responsabile for physical security).
It offer low-latency, local data processing, data residency and a fully managed service with wide variety of AWS services working on it (EC2, EBS, S3, EKS, ECS, RDS, EMR).

### AWS WaveLength

Wavelength Zones represent Infrastructure depyloment integrate with telecommunication providers datacenter at the edge of the 5G networks.
Used for ultra-low latency application through 5G networks (traffic doesn't leave Communication Service Provider's (CSP) network).

### AWS Local Zones

Placecs AWS compute, storage, databse and other selected AWS services closer to end users to run latency-sensistive application. Basically extends your VPC to more locations and is compatible with EC2, RDS, ECS, EBS, ElastiCache, etc.
