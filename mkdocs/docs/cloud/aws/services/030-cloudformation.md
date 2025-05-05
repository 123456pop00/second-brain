# AWS CloudFormation

## Overview

CloudFormation is a declarative way of outlining your AWS Infrastructure. It allows you to create and manage AWS resources by treating infrastructure as code.

## Key Features
- Infrastructure as Code with full resource coverage
- Automated resource provisioning and management
- Version control support for infrastructure
- Cost tracking and optimization capabilities
- Built-in dependency management
- Extensible through custom resources

## Key Concepts

### Templates
- JSON or YAML text files containing infrastructure specifications
- Define AWS resources and their configurations
- Support dynamic parameters and conditions
- Enable resource reuse across deployments

### Stacks
- Collection of AWS resources managed as a single unit
- Created, updated, and deleted based on template changes
- Support rollback on failure
- Enable organized resource management

### StackSets
- Deploy stacks across multiple accounts and regions
- Manage infrastructure at scale
- Support centralized deployment management

### Change Sets
- Preview proposed changes before execution
- Validate infrastructure modifications
- Ensure safe deployment processes

## Components

### Building Blocks
1. Resources (MANDATORY)
   - AWS resources declared in the template
   - Core component of CloudFormation
   - Supports most AWS services
2. Parameters
   - Dynamic inputs for templates
   - Enable template reuse
   - Support validation and constraints
3. Mappings
   - Static variables within templates
   - Used for environment-specific values
   - Support conditional resource configuration
4. Outputs
   - Export values for cross-stack reference
   - Enable stack integration
   - Support resource sharing
5. Conditions
   - Control resource creation
   - Enable environment-specific deployments
   - Support dynamic configuration
6. Metadata
   - Additional template information
   - Support template documentation
   - Enable additional functionality

### Template Helpers
1. References
   - Link resources within templates
   - Enable dynamic value resolution
   - Support resource dependencies
2. Functions
   - Perform operations within templates
   - Enable dynamic configuration
   - Support complex scenarios

## Operations

### Deployment Methods
1. Manual Deployment
   - Using CloudFormation Designer
   - Console-based parameter input
   - Visual template editing
2. Automated Deployment
   - Using AWS CLI
   - Template file-based
   - Supports CI/CD integration

### Stack Management
- Creation: Deploy new infrastructure
- Updates: Modify existing resources
- Deletion: Remove infrastructure
- Monitoring: Track stack status

## Best Practices
- Version control templates
- Use stack policies for resource protection
- Implement change sets for validation
- Document templates thoroughly
- Use cross-stack references where appropriate
- Implement proper tagging strategy

## Security
- Use IAM roles for stack operations
- Implement stack policies
- Encrypt sensitive parameters
- Regular security audits
- Access logging and monitoring

## Error Handling
- Stack Creation Failures
  - Default rollback on failure
  - Option to disable rollback for troubleshooting
  - Detailed error logging
- Stack Update Failures
  - Automatic rollback to previous state
  - Error logs for troubleshooting
  - Support for manual intervention

## Example Template
```yaml
AWSTemplateFormatVersion: "2010-09-09"
Description: "Template to create an EC2 instance"
Metadata:
  Instances:
    Description: "Web Server Instance"
Parameters:
  EnvType:
    Description: "Environment type"
    Type: String
    AllowedValues:
      - prod
      - test
Conditions:
  CreateProdResources: !Equals [ !Ref EnvType, prod ]
Mappings:
  RegionMap:
    eu-west-1:
      "ami": "ami-394534954395e"
Transform:
  Name: 'AWS::Include'
  Parameters:
    Location: "s3://MyAmazonS3BucketName/MyFileName.yaml"
Resources:
  EC2Instance:
    Type: AWS::EC2::Instance
    Properties:
      InstanceType: t2.micro
      ImageId: ami-0db1d6c9349334334
Outputs:
  InstanceID:
    Description: The Instance ID
    Value: !Ref EC2Instance
```

## Exam Tips

- The stack may be stuck in the DELETE_FAILED state because the dependent object (security group), can't be deleted. This can be for many reasons, for example, the security group could have an ENI attached that’s not part of the CloudFormation stack. To delete the stack you must choose to delete the stack in the console and then select to retain the resource(s) that failed to delete. This can also be achieved from the AWS CLI: