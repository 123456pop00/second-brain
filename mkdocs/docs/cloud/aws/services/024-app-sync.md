# AWS AppSync

## Overview

AWS AppSync is a fully managed service that makes it easy to develop GraphQL APIs by handling the heavy lifting of securely connecting to data sources like AWS DynamoDB, Lambda, and more.

## Key Features
- Managed GraphQL API service
- Real-time data synchronization and offline support
- Integrates with DynamoDB, Lambda, Elasticsearch, HTTP, and RDS
- Built-in security with API keys, IAM, Cognito, and OIDC
- Fine-grained access control with GraphQL schema
- Supports subscriptions for real-time updates

## Architecture
- Schema-driven development
- Connects to multiple data sources
- Resolvers map GraphQL operations to data sources
- Pipeline resolvers for complex business logic

## Security
- API key, IAM, Amazon Cognito, and OIDC authentication
- Field-level authorization
- Encryption in transit and at rest

## Monitoring & Logging
- Integrated with CloudWatch for metrics and logging
- Tracing with AWS X-Ray

## Best Practices
- Use fine-grained access control in your schema
- Monitor API usage and set up alerts
- Use subscriptions for real-time updates
- Secure APIs with appropriate authentication methods
- Optimize resolvers for performance

## Caching

AWS AppSync’s API Cache settings provides three options: 
- None
- Full request caching
- Per-resolver caching.