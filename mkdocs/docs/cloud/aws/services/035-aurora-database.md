# AWS Aurora Database

## Overview

Amazon Aurora is a MySQL- and PostgreSQL-compatible relational database built for the cloud, combining the performance and availability of high-end commercial databases with the simplicity and cost-effectiveness of open-source databases.

## Key Features
- MySQL and PostgreSQL compatibility
- Up to 5x performance of standard MySQL and 3x of PostgreSQL
- Replicated 6 ways across 3 Availability Zones
- Automated failover, backup, and replication
- Serverless and Global Database options
- High durability and fault tolerance

## Architecture
- Clustered storage with separation of compute and storage
- Storage automatically grows in 10GB increments up to 128TB
- Replication across multiple AZs for high availability
- Supports read replicas for scaling read workloads

## Security
- Encryption at rest and in transit
- IAM-based authentication
- VPC support for network isolation
- Automated backups and point-in-time recovery

## Monitoring & Logging
- Integrated with CloudWatch for metrics and alarms
- Performance Insights for query analysis
- Audit logging for compliance

## Best Practices
- Use read replicas for scaling
- Enable automatic backups and monitoring
- Secure clusters with IAM and VPC
- Use Aurora Serverless for variable workloads
- Monitor performance and set up alerts

## Aurora Replicas

Aurora Replicas can help improve read scaling because it synchronously updates data with the primary database (within 100 ms). Aurora Replicas are created in the same DB cluster within a Region. With Aurora MySQL you can also enable binlog replication to another Aurora DB cluster which can be in the same or a different Region.