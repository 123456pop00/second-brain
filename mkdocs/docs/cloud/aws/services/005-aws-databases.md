# AWS Databases

## Overview

AWS offers a wide range of managed database services to support various use cases, including relational, NoSQL, in-memory, graph, time series, and ledger databases.

## Relational Databases

### Amazon RDS (Relational Database Service)
- Supports multiple engines: MySQL, PostgreSQL, MariaDB, Oracle, SQL Server, and Amazon Aurora
- Automated backups, patching, and failover
- Multi-AZ deployments for high availability
- Read replicas for scaling read workloads

### Amazon Aurora
- MySQL and PostgreSQL compatible
- Up to 5x performance of standard MySQL and 3x of PostgreSQL
- Replicated 6 ways across 3 AZs
- Automated failover, backup, and replication

## NoSQL Databases

### Amazon DynamoDB
- Fully managed NoSQL database
- Single-digit millisecond latency
- Supports key-value and document data models
- Built-in security, backup, and restore
- Global tables for multi-region, multi-master replication

### Amazon DocumentDB
- MongoDB-compatible document database
- Fully managed, scalable, and highly available

## In-Memory Databases

### Amazon ElastiCache
- Supports Redis and Memcached
- In-memory caching for high performance
- Use cases: caching, session stores, real-time analytics

## Graph Databases

### Amazon Neptune
- Fully managed graph database
- Supports property graph and RDF graph models
- Use cases: social networking, fraud detection, knowledge graphs

## Time Series Databases

### Amazon Timestream
- Fully managed time series database
- Optimized for IoT and operational applications
- Fast ingestion and querying of time series data

## Ledger Databases

### Amazon QLDB (Quantum Ledger Database)
- Fully managed ledger database
- Immutable and cryptographically verifiable transaction log
- Use cases: supply chain, registrations, banking transactions

## Migration Services

### AWS Database Migration Service (DMS)
- Migrate databases to AWS easily and securely
- Supports homogeneous and heterogeneous migrations
- Minimal downtime during migration

## Best Practices
- Choose the right database for your workload
- Use managed services for scalability and reliability
- Enable automated backups and multi-AZ deployments
- Monitor performance and set up alerts
- Secure databases with IAM, encryption, and network controls
