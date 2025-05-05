# AWS Lambda

## Overview

AWS Lambda is a serverless compute service that runs code in response to events and automatically manages the underlying compute resources. You can use Lambda to extend other AWS services with custom logic or create your own backend services.

## Key Features
- Serverless compute service
- Automatic scaling and resource management
- Pay-per-use pricing model
- Support for multiple programming languages
- Event-driven architecture
- Integration with AWS services
- Custom runtime support

## Supported Languages
- Node.js (JavaScript)
- Python
- Java (Java 8 compatible)
- C# (.NET Core)
- Ruby
- Go
- PowerShell
- Custom Runtime API support

## Configuration

### Basic Settings
- Memory: 128MB to 3008MB (64MB increments)
- Timeout: Default 3 seconds, maximum 15 minutes
- Environment variables
- VPC configuration
- IAM execution role

### Runtime Environment
- Temporary runtime initialization for external dependencies
- /tmp directory with 512MB storage
- Stateless execution
- Reusable container optimization

## Invocation Types

### Synchronous Invocation
- Direct invocation with immediate response
- Used by:
  - Application Load Balancer
  - API Gateway
  - CloudFront (Lambda@Edge)
  - S3 Batch
  - Cognito
  - Step Functions

### Asynchronous Invocation
- Event-based invocation with queued processing
- Automatic retries (3 times)
- Dead Letter Queue support
- Used by:
  - S3
  - SNS
  - CloudWatch Events/EventBridge
  - CodeCommit
  - CodePipeline

## Event Source Mapping
- For stream-based invocation (Kinesis, DynamoDB Streams)
- For queue-based invocation (SQS, SQS FIFO)
- Processes records in order for streams
- Configurable batch size and window
- Error handling with split-batch capability

## Networking
- VPC Access capabilities
- ENI (Elastic Network Interface) creation
- Private subnet deployment
- NAT Gateway requirement for internet access
- VPC Endpoint support for AWS services

## Scaling and Performance
### Concurrency
- Reserved concurrency limits
- Provisioned concurrency for cold start management
- Account limits and quotas
- Regional limits (1000 concurrent executions default)

### Cold Starts
- Initial container startup latency
- Optimization strategies:
  - Provisioned concurrency
  - Keep warm strategies
  - Code optimization

## Cost Optimization
- Pay for compute time in 100ms increments
- Pay for the number of requests
- Free tier: 1M requests and 400,000 GB-seconds
- Cost factors:
  - Memory allocation
  - Execution duration
  - Request count
  - Data transfer

## Best Practices
1. Function Design
   - Single responsibility principle
   - Optimize function size
   - Reuse execution context
   - Manage dependencies efficiently

2. Error Handling
   - Implement proper error handling
   - Use Dead Letter Queues
   - Configure retry policies
   - Monitor function health

3. Security
   - Use IAM roles with least privilege
   - Encrypt environment variables
   - Implement VPC security groups
   - Regular security audits

4. Monitoring
   - Use CloudWatch metrics
   - Implement custom metrics
   - Set up alerts
   - Use X-Ray for tracing

## Versions and Aliases
- Version Management
  - Immutable versions
  - $LATEST version
  - Version numbering
  - Version metadata

- Alias Features
  - Mutable pointers to versions
  - Traffic shifting capability
  - Environment management
  - Blue-green deployment support

## Lambda@Edge
- CloudFront integration
- Global function deployment
- Request/Response manipulation
- Edge location execution
- Use cases:
  - A/B testing
  - User authentication
  - Content customization
  - Bot protection

## Limits and Quotas
### Execution Limits
- Memory: 128MB - 3008MB
- Timeout: 900 seconds (15 minutes)
- Environment variables: 4KB
- Disk space (/tmp): 512MB
- Concurrent executions: 1000 per account

### Deployment Limits
- Deployment package:
  - 50MB (compressed)
  - 250MB (uncompressed)
- Stack depth for synchronous calls: 1000
- Async event queue: 6 hours