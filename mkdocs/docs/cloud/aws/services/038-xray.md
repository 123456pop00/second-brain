# AWS X-Ray

## Overview

AWS X-Ray is a distributed tracing service that helps developers analyze and debug production, distributed applications, such as those built using a microservices architecture.

## Key Features
- Distributed tracing for applications
- Visualizes service maps and traces
- Identifies bottlenecks and performance issues
- Integrates with AWS Lambda, EC2, ECS, Elastic Beanstalk, and more
- Supports custom instrumentation for any application

## Architecture
- X-Ray SDKs instrument your application code
- Traces are collected and sent to the X-Ray service
- Service maps show relationships between components
- Segments and subsegments provide detailed timing data

## Security
- IAM-based access control
- Encryption in transit and at rest
- VPC endpoint support

## Monitoring & Logging
- Integrated with CloudWatch for metrics and logs
- Trace data retention and filtering

## Best Practices
- Instrument all application components
- Use annotations and metadata for custom insights
- Monitor trace data and set up alerts
- Use service maps to identify and resolve bottlenecks

## Segment Document

A **segment document** conveys information about a segment to X-Ray. A segment document can be up to 64 kB and contain a whole segment with subsegments, a fragment of a segment that indicates that a request is in progress, or a single subsegment that is sent separately. You can send segment documents directly to X-Ray by using the [PutTraceSegments](https://docs.aws.amazon.com/xray/latest/api/API_PutTraceSegments.html) API.
A subset of segment fields are indexed by X-Ray for use with filter expressions. For example, if you set the user field on a segment to a unique identifier, you can search for segments associated with specific users in the X-Ray console or by using the `GetTraceSummaries` API.

## Annotations and Metadata

You can record additional information about requests, the environment, or your application with annotations and metadata. You can add annotations and metadata to the segments that the X-Ray SDK creates, or to custom subsegments that you create.

### Annotations

**Annotations** are key-value pairs with string, number, or Boolean values. Annotations are indexed for use with [filter expressions](https://docs.aws.amazon.com/xray/latest/devguide/xray-console-filters.html). Use annotations to record data that you want to use to group traces in the console, or when calling the [GetTraceSummaries](https://docs.aws.amazon.com/xray/latest/api/API_GetTraceSummaries.html) API.

### Metadata

**Metadata** are key-value pairs that can have values of any type, including objects and lists, but are not indexed for use with filter expressions. Use metadata to record additional data that you want stored in the trace but don't need to use with search.