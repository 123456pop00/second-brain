# Elastic Load Balancer (ELB) & Auto-Scaling Groups (ASG)

## Overview

Elastic Load Balancer (ELB) and Auto-Scaling Groups (ASG) are core AWS services for building scalable, highly available, and resilient applications.

## Key Concepts

### Scalability
- Application can handle greater loads by adapting
- Vertical: increasing the size of the instance
- Horizontal: increasing the number of instances

### High Availability
- Running your application in at least 2 Availability Zones

### Elasticity
- Scale per use (if low-use down-scale, if highly-used up-scale)

## Load Balancers

Servers that forward internet traffic to multiple servers downstream. They are used for:
- Spreading load across multiple instances
- Exposes a single-point of access (DNS) to your application
- Seamlessly handle failure of downstream instances
- Do regular healthchecks
- Provide SSL
- High Availability

### Types of ELB
- Application Load Balancer (ALB) (HTTP(s)) - works on layer 7 (OSI model)
- Network Load Balancer (NLB) (ultra-high performance, allows for TCP) - works on layer 4
- Classic Load Balancer (slowly retiring) - works on layer 7 and 4

## Auto-Scaling Group (ASG)

Allows you to:
- Scale out (add EC2 instances) to match an increased load
- Scale in (remove EC2 instance) to match a decreased load
- Ensure minimum and maximum number of instances
- Automatically register new instances to a load balancer
- Replace unhealthy instances
- Cost savings (only run at optimal capacity)

### Scaling Strategies
1. Manual Scaling: Update the size (minimum, maximum, desired) of an ASG manually
2. Dynamic Scaling: Respond to changing demand
    - Simple / Step Scaling: based on threshold (CloudWatch CPU > 70% or < 30% => scale out / scale in)
    - Target Tracking Scaling: E.g.: I want the average ASG CPU to stay around 40%
    - Scheduled Scaling:  E.g.: increase minimum capacity to 10 at 5 pm
    - Predictive Scaling: use ML to predict future traffic
