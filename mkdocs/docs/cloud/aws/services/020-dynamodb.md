# Amazon DynamoDB

## Overview

Amazon DynamoDB is a fully managed NoSQL database service providing fast, predictable performance with seamless scalability. It offers flexible schema, automatic scaling, and serverless operation.

## Key Features
- Fully managed NoSQL database
- Consistent single-digit millisecond latency
- Built-in security and backup
- Automatic scaling
- Point-in-time recovery
- Global tables for multi-region deployment

## Core Concepts

### Tables, Items, and Attributes
- Tables: Collection of data
- Items: Group of attributes (similar to rows)
- Attributes: Fundamental data elements
- Flexible schema design
- Support for nested attributes

### Primary Keys
- Partition Key (HASH)
  - Must be unique for each item
  - Used for data distribution
- Sort Key (RANGE) - Optional
  - Creates composite keys
  - Enables complex queries

## Capacity Management

### Read Capacity Units (RCU)
- Provisioned throughput for reads
- 1 RCU = 1 strongly consistent read/second (4KB)
- 1 RCU = 2 eventually consistent reads/second (4KB)
- Auto-scaling support
- Burst capacity with credit system

### Write Capacity Units (WCU)
- Provisioned throughput for writes
- 1 WCU = 1 write/second (1KB)
- Auto-scaling capabilities
- Burst credits available

### On-Demand Capacity
- Pay-per-request pricing
- No capacity planning required
- Automatic scaling
- Best for unpredictable workloads

## Data Operations

### Writing Data
- PutItem: Create/Replace items
- UpdateItem: Modify attributes
- BatchWriteItem: Multiple writes
- Conditional writes
- Atomic counters

### Reading Data
- GetItem: Single item retrieval
- BatchGetItem: Multiple items
- Query: Efficient key-based search
- Scan: Full table search
- ProjectionExpression support
- Filtering capabilities

### Consistency Models
- Eventually Consistent Reads
  - Lower cost
  - Higher availability
  - Possible stale data
- Strongly Consistent Reads
  - Latest data guarantee
  - Higher cost
  - Potential higher latency

## Advanced Features

### DynamoDB Accelerator (DAX)
- In-memory caching
- Microsecond latency
- Write-through caching
- No application code changes
- Ideal for read-heavy workloads

### Global Tables
- Multi-region replication
- Active-active configuration
- Eventually consistent
- Automatic conflict resolution
- Cross-region redundancy

### Streams
- Change data capture
- Event-driven architectures
- Lambda integration
- 24-hour retention
- Ordered record delivery

### Time To Live (TTL)
- Automatic item deletion
- Based on timestamp attribute
- No extra cost
- Background processing
- Streams integration

## Security

### Authentication
- IAM integration
- Fine-grained access control
- Role-based access
- Temporary credentials

### Encryption
- Encryption at rest
- SSL/TLS for transit
- KMS integration
- Customer managed keys

### Backup and Recovery
- On-demand backups
- Point-in-time recovery
- Zero performance impact
- Cross-region copying
- Restore to new table

## Performance Optimization

### Partition Management
- Even key distribution
- Avoid hot partitions
- Monitor metrics
- Adaptive capacity

### Best Practices
1. Key Design
   - Distribute load evenly
   - Avoid hot keys
   - Use composite keys effectively
2. Query Optimization
   - Use Query over Scan
   - Project needed attributes
   - Implement pagination
   - Use indexes effectively
3. Capacity Management
   - Monitor utilization
   - Implement auto-scaling
   - Use burst capacity wisely
   - Consider on-demand mode

## Cost Optimization
- Choose appropriate capacity mode
- Use auto-scaling
- Implement TTL for cleanup
- Monitor and optimize indexes
- Use appropriate consistency model

## Limits and Quotas
- Item size: 400KB
- Table size: Unlimited
- Partition key length: 2048 bytes
- Sort key length: 1024 bytes
- Secondary indexes per table: 20
- Concurrent table operations: 50
- API rate limits vary by operation