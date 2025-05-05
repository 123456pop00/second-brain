# Architecting and Ecosystem

## Guiding Principes

- Stop guessing your capacity needs
- Test systems at production scale
- Automate to make architectural experimentation easier
- Allow for evolutionary architectures (design based on changing requirements)
- Drive architecture using data
- Improve through game days (simulate application for flash sale days)

## AWS Cloud Best Practices - Design Principles

**Scalability**: vertical & horizontal

**Disposable Resources**: servers should be disposable & easily configured

**Automation**: Serverless, IaaS, Auto Scalling...

**Loose Coupling**

**Services not Servers**

## Well Architected Framework 6 Pillars

Note: The'ye a synergy (not to balance or trade-offs)

### Operational Excellence

Includes ability to run and monitor systems to deliver business value and continually improve supporting processes and procedures. 

**Design principles**:
- Perform operations as code: IaaS
- Annotate documentation: automate creation of annotated documentation after each build
- Make frequent, small, reversible changes
- Refine operation procedures frequently
- Anticipate failure
- Learn from all operational failures

| Prepare | Operate | Evolve |
| ------- | ------- | ------ |
| Cloud Formation | Cloud Formation | Cloud Formation| 
| Config | Config | Code Build| 
| | CloudTrail | Code Commit |
| | CloudWatch | CodeDeploy |
| | AWS X-Ray | CodePipeline |

### Security

Include the ability to protect information, systems and assets while delivering business value through risk assesments and mitigation strategies.

**Design principles**:
- Implement a strong identity foundation: centralize privilege management and reduce reliance on long-term credentials (least privilige principle)
- Enable tracebility
- Apply security at all layers
- Automate security best practices
- Protect data in transit and at rest
- Keep people away from data
- Prepare for security events
- Shared responsability model

### Reliability

Ability of a system to recover from infrastructure or service disruptions, dynamically acquire computing resources to meet demand and mitigate disruptions such misconfigurations or transient network issues.

**Design principles**:
- Test recovery procedures: simulate different failure to recreate scenarios
- Automatically recover from failure: anticipate and remediate failure before they occur
- Scale horizontally to increase aggregate system availability
- Stop guessing capacity
- Manage change in automation

### Performance Efficiency

Includes the ability to use computing resources efficiently to meet system requirements and to maintain efficiency as demand and technologies changes.

**Design principles**:
- Democratize advanced technologies
- Go global in minutes: easy deployment in multiple regions
- Use serverless architectures
- Experiment more often
- Mechanical Sympathy: be aware of all AWS services

### Cost Optimization

Includes the ability to run systems to deliver business value at the lowest price point.

**Design principles**:
- Adopt a consumption mode: pay only for what you use
- Measure overall efficiency: Use CloudWatch
- Stop spending money on data center operations
- Analyze and attribute expenditure
- Use managed and appliaction level services to reduce cost of ownership

### Sustainability

Focuses on minimzing the environmental impacts of running cloud workloads

**Design principles**:
- Understand your impact
- Establish sustainability goals
- Maximize utilization
- Anticipate and adopt new more efficient hardware and software offerings
- Use managed services
- Reduce downstream impact of you cloud workloads: reduce amount of energy or resources required to use you services

## AWS Professional Services & Partener Network

**APN** = AWS Partener Network

- APN Technology Parteners: provide hardware, connectivity and software

- APN Consulting Parteners: professional services firm to help build on AWS

- APN Training Parteners: find who can help you learn AWS

**Programs**

- AWS Competency Program = AWS Competencies are granted to APN Parteners who have demostrated technical proficiency and proven customer success

- AWS Navigate Program = help parteners become better parteners

## Other Ecosystem Services

- AWS Knowledge Cener = container most frequent & common questions and requests

- AWS IQ = quickly find professional help for your AWS projects

- AWS re:Post: offering crowd-sourced expert-reviewed answers to your technical questions (part of free tier)
