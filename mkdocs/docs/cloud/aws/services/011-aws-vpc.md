# Amazon VPC (Virtual Private Cloud)

## Overview

Amazon VPC lets you provision a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define. You have complete control over your virtual networking environment.

## Key Concepts

### VPC
- A virtual network dedicated to your AWS account
- Spans a single region
- Can have multiple subnets (each in a single AZ)

### Subnets
- Subdivide your VPC's IP address range
- Public subnets: direct access to the internet
- Private subnets: no direct internet access

### Route Tables
- Control traffic routing within your VPC
- Each subnet must be associated with a route table

### Internet Gateway (IGW)
- Allows communication between instances in your VPC and the internet
- Attach one IGW per VPC

### NAT Gateway / NAT Instance
- Allow instances in a private subnet to connect to the internet, but prevent the internet from initiating connections with those instances

### VPC Peering
- Connects two VPCs privately using AWS network
- Can be within or across regions
- No transitive peering

### VPC Endpoints
- Privately connect your VPC to supported AWS services and VPC endpoint services
- Two types: Interface endpoints (powered by PrivateLink) and Gateway endpoints (for S3 and DynamoDB)

### Security Groups & NACLs
- Security Groups: virtual firewalls for instances (stateful)
- Network ACLs: control traffic at the subnet level (stateless)

## Best Practices
- Use multiple AZs for high availability
- Separate public and private subnets
- Use security groups and NACLs for layered security
- Monitor VPC flow logs for network traffic analysis
- Use VPC endpoints for private connectivity to AWS services

### VPC Flow Logs

Used to capture information about IP traffic going into your interfaces and which can go into S3 / CloudWatch Logs:
- VPC Flow Logs
- Subnet Flow Logs
- Elastic Network Interface Flow Logs

### PrivateLink

Most secure * scalable way to expose a service to 1000s of VPCs without requiring VPC peering, internet gateway, NAT, route tables. It requires a network load balance (Service VPC) and ENI (Customer VPC)

### Site to Site VPN & Direct Connect

**Site to Site VPN** = Connects on-premises VPN to AWS with the connection being automatically encrypted going over the public internet
- On-premises must use a Customer Gateway (CGW)
- AWS must use a Virtual Private Gateway (VGW)

**Direct Connect** = Establish an actual physical connection between on-premises and AWS, private and secure going over a private network

### AWS Client VPN

Connect from your computer using OpenVPN to your private network in AWS and on-premises, allowing you to connect to your EC2 instances over a private IP with the traffic going over the public internet.

### Transit Gateway

Used for having transitive peering between thousands of VPC and on-premises, hub-and-spoke (star) connection by providing a single gateway.
