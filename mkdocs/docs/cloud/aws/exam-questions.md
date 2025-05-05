
# From [Udemy Practice Exams](https://msg-global.udemy.com/course/aws-developer-associate-practice-exams/learn/quiz/4852734/results?expanded=1278242676#overview) - Not Stephane-only

1. A programmer is creating an application that requires signed requests (Signature Version 4) for invoking other AWS services. Having constructed a canonical request, created the string to sign, and calculated the signing information, which strategies can the programmer apply to finalize a signed request? (Select TWO.)
	1. When sending a request to AWS services using Signature Version 4, the signature should be included in the "Authorization" HTTP header or as a parameter "X-Amz-Signature" in the query string.
2. A Development team has deployed several applications running on an Auto Scaling fleet of Amazon EC2 instances. The Operations team have asked for a display that shows a key performance metric for each application on a single screen for monitoring purposes.
	1. Create a custom namespace with a unique metric name for each application
	2. Explanation: Therefore, the Developer should create a custom namespace with a unique metric name for each application. This namespace will then allow the metrics for each individual application to be shown in a single view through CloudWatch.
3. An application is using Amazon DynamoDB as its data store and needs to be able to read 100 items per second as strongly consistent reads. Each item is 5 KB in size. What value should be set for the table's provisioned throughput for reads?
	1. To determine the number of RCUs required to handle 100 strongly consistent reads per/second with an average item size of 5KB, perform the following steps:
	2. Determine the average item size by rounding up the next multiple of 4KB (5KB rounds up to 8KB).
	3. Determine the RCU per item by dividing the item size by 4KB (8KB/4KB = 2).
	4. Multiply the value from step 2 with the number of reads required per second (2x100 = 200).
4. An application uses both Amazon EC2 instances and on-premises servers. The on-premises servers are a critical component of the application, and a developer wants to collect metrics and logs from these servers. The developer would like to use Amazon CloudWatch. How can the developer accomplish this?
	1. Install the CloudWatch agent on the on-premises servers and specify IAM credentials with permissions to CloudWatch.
5. A Developer is designing a fault-tolerant environment where client sessions will be saved. How can the Developer ensure that no sessions are lost if an Amazon EC2 instance fails?
	1. Use Amazon DynamoDB to perform scalable session handling
	2. The **DynamoDB Session Handler** is a custom session handler for PHP that allows developers to use Amazon DynamoDB as a session store. Using DynamoDB for session storage alleviates issues that occur with session handling in a distributed web application by moving sessions off of the local file system and into a shared location. DynamoDB is fast, scalable, easy to setup, and handles replication of your data automatically.
6. An application uses Amazon API Gateway, an AWS Lambda function and a DynamoDB table. The developer requires that another Lambda function is triggered when an item lifecycle activity occurs in the DynamoDB table.
	1. Enable a DynamoDB stream and trigger the Lambda function synchronously from the stream
7. A company uses an Amazon S3 bucket to store a large number of sensitive files relating to eCommerce transactions. The company has a policy that states that all data written to the S3 bucket must be encrypted.
	1. Create an S3 bucket policy that denies any S3 Put request that does not include the x-amz-server-side-encryption
8. An application is being migrated into the cloud. The application is stateless and will run on a fleet of Amazon EC2 instances. The application should scale elastically. How can a Developer ensure that the number of instances available is sufficient for current demand?
	1. Create a launch configuration and use Amazon EC2 Auto Scaling
9. A Developer is designing a cloud native application. The application will use several AWS Lambda functions that will process items that the functions read from an event source. Which AWS services are supported for Lambda event source mappings? (Select THREE.)
	1. Amazon Simple Queue Service (SQS)
	2. Amazon DynamoDB
	3. Amazon Kinesis
10. An engineer is constructing an AWS Lambda function and intends to log specific key events that transpire during the function's execution. To correlate the events with a particular function invocation, the engineer is looking to incorporate a unique identifier. The following code segment has been added to the Lambda function: function handler (event, context) {}
	1. Use **context.awsRequestId** within the function to fetch the unique identifier associated with each invocation.


# From [Exam Topics DVA-C02 ](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate-dva-c02/view/)

#### Question 1 (marked)
A company is implementing an application on Amazon EC2 instances. The application needs to process incoming transactions. When the application detects a transaction that is not valid, the application must send a chat message to the company's support team. To send the message, the application needs to retrieve the access token to authenticate by using the chat API.  
A developer needs to implement a solution to store the access token. The access token must be encrypted at rest and in transit. The access token must also be accessible from other AWS accounts.  
Which solution will meet these requirements with the LEAST management overhead?

C. Use AWS Secrets Manager with an AWS Key Management Service (AWS KMS) customer managed key to store the access token. Add a resource-based policy to the secret to allow access from other accounts. Update the IAM role of the EC2 instances with permissions to access Secrets Manager. Retrieve the token from Secrets Manager. Use the decrypted access token to send the message to the chat

**Note**: You cannot use a resource-based policy with a parameter in the Parameter Store
#### Question 2

A company is running Amazon EC2 instances in multiple AWS accounts. A developer needs to implement an application that collects all the lifecycle events of the EC2 instances. The application needs to store the lifecycle events in a single Amazon Simple Queue Service (Amazon SQS) queue in the company's main AWS account for further processing.  
Which solution will meet these requirements?

D. Configure the permissions on the main account event bus to receive events from all accounts. Create an Amazon EventBridge rule in each account to send all the EC2 instance lifecycle events to the main account event bus. Add an EventBridge rule to the main account event bus that matches all EC2 instance lifecycle events. Set the SQS queue as a target for the rule


#### Question 3

An application is using Amazon Cognito user pools and identity pools for secure access. A developer wants to integrate the user-specific file upload and download features in the application with Amazon S3. The developer must ensure that the files are saved and retrieved in a secure manner and that users can access only their own files. The file sizes range from 3 KB to 300 MB.  
Which option will meet these requirements with the HIGHEST level of security?

D. Use an IAM policy within the Amazon Cognito identity prefix to restrict users to use their own folders in Amazon S3.

#### Question 4

A company is building a scalable data management solution by using AWS services to improve the speed and agility of development. The solution will ingest large volumes of data from various sources and will process this data through multiple business rules and transformations.  
The solution requires business rules to run in sequence and to handle reprocessing of data if errors occur when the business rules run. The company needs the solution to be scalable and to require the least possible maintenance.  
Which AWS service should the company use to manage and automate the orchestration of the data flows to meet these requirements?

 B. AWS Step Functions

#### Question 5

A developer has created an AWS Lambda function that is written in Python. The Lambda function reads data from objects in Amazon S3 and writes data to an Amazon DynamoDB table. The function is successfully invoked from an S3 event notification when an object is created. However, the function fails when it attempts to write to the DynamoDB table.  
What is the MOST likely cause of this issue?

C. The Lambda function does not have IAM permissions to write to DynamoDB.

#### Question 6

A developer is creating an AWS CloudFormation template to deploy Amazon EC2 instances across multiple AWS accounts. The developer must choose the EC2 instances from a list of approved instance types.  
How can the developer incorporate the list of approved instance types in the CloudFormation template?

D. In the CloudFormation template, create a parameter with the list of EC2 instance types as AllowedValues.

#### Question 7

A developer has an application that makes batch requests directly to Amazon DynamoDB by using the BatchGetItem low-level API operation. The responses frequently return values in the UnprocessedKeys element.  
Which actions should the developer take to increase the resiliency of the application when the batch response includes values in UnprocessedKeys? (Choose two.)

B. Retry the batch operation with exponential backoff and randomized delay.
D. Increase the provisioned read capacity of the DynamoDB tables that the operation accesses.


#### Question 8

A company is running a custom application on a set of on-premises Linux servers that are accessed using Amazon API Gateway. AWS X-Ray tracing has been enabled on the API test stage.  
How can a developer enable X-Ray tracing on the on-premises servers with the LEAST amount of configuration?

B. Install and run the X-Ray daemon on the on-premises servers to capture and relay the data to the X-Ray service.

#### Question 9

A company wants to share information with a third party. The third party has an HTTP API endpoint that the company can use to share the information. The company has the required API key to access the HTTP API.  
The company needs a way to manage the API key by using code. The integration of the API key with the application code cannot affect application performance.  
Which solution will meet these requirements MOST securely?

A. Store the API credentials in AWS Secrets Manager. Retrieve the API credentials at runtime by using the AWS SDK. Use the credentials to make the API call. Most Voted

#### Question 10

A developer is deploying a new application to Amazon Elastic Container Service (Amazon ECS). The developer needs to securely store and retrieve different types of variables. These variables include authentication information for a remote API, the URL for the API, and credentials. The authentication information and API URL must be available to all current and future deployed versions of the application across development, testing, and production environments.  
How should the developer retrieve the variables with the FEWEST application changes?

A. Update the application to retrieve the variables from AWS Systems Manager Parameter Store. Use unique paths in Parameter Store for each variable in each environment. Store the credentials in AWS Secrets Manager in each environment.

#### Question 11

A company is migrating legacy internal applications to AWS. Leadership wants to rewrite the internal employee directory to use native AWS services. A developer needs to create a solution for storing employee contact details and high-resolution photos for use with the new application.  
Which solution will enable the search and retrieval of each employee's individual details and high-resolution photos using AWS APIs?

B. Store each employee's contact information in an Amazon DynamoDB table along with the object keys for the photos stored in Amazon S3.

#### Question 12

A developer is creating an application that will give users the ability to store photos from their cellphones in the cloud. The application needs to support tens of thousands of users. The application uses an Amazon API Gateway REST API that is integrated with AWS Lambda functions to process the photos. The application stores details about the photos in Amazon DynamoDB.  
Users need to create an account to access the application. In the application, users must be able to upload photos and retrieve previously uploaded photos. The photos will range in size from 300 KB to 5 MB.  
Which solution will meet these requirements with the LEAST operational overhead?

B. Use Amazon Cognito user pools to manage user accounts. Create an Amazon Cognito user pool authorizer in API Gateway to control access to the API. Use the Lambda function to store the photos in Amazon S3. Store the object's S3 key as part of the photo details in the DynamoDB table. Retrieve previously uploaded photos by querying DynamoDB for the S3 key.

#### Question 13

A company receives food orders from multiple partners. The company has a microservices application that uses Amazon API Gateway APIs with AWS Lambda integration. Each partner sends orders by calling a customized API that is exposed through API Gateway. The API call invokes a shared Lambda function to process the orders.  
Partners need to be notified after the Lambda function processes the orders. Each partner must receive updates for only the partner's own orders. The company wants to add new partners in the future with the fewest code changes possible.  
Which solution will meet these requirements in the MOST scalable way?

C. Create an Amazon Simple Notification Service (Amazon SNS) topic. Configure the Lambda function to publish messages with specific attributes to the SNS topic. Subscribe each partner to the SNS topic. Apply the appropriate filter policy to the topic subscriptions.

#### Question 14 (marked)

A financial company must store original customer records for 10 years for legal reasons. A complete record contains personally identifiable information (PII). According to local regulations, PII is available to only certain people in the company and must not be shared with third parties. The company needs to make the records available to third-party organizations for statistical analysis without sharing the PII.  
A developer wants to store the original immutable record in Amazon S3. Depending on who accesses the S3 document, the document should be returned as is or with all the PII removed. The developer has written an AWS Lambda function to remove the PII from the document. The function is named removePii.  
What should the developer do so that the company can meet the PII requirements while maintaining only one copy of the document?

C. Create an S3 Object Lambda access point from the S3 console. Select the removePii function. Use S3 Access Points to access the object without PII. (An S3 Object Lambda access point is a new type of access point that you can create to invoke your own AWS Lambda function to modify the content of an S3 object. You can use S3 Object Lambda access points to transform data as it is being retrieved from an S3 bucket, without modifying the original data stored in the bucket)

#### Question 15

A developer is deploying an AWS Lambda function The developer wants the ability to return to older versions of the function quickly and seamlessly.  
How can the developer achieve this goal with the LEAST operational overhead?

B. Use a function alias with different versions.

#### Question 16

A developer has written an AWS Lambda function. The function is CPU-bound. The developer wants to ensure that the function returns responses quickly.  
How can the developer improve the function's performance?

B. Increase the function's memory.

#### Question 17

For a deployment using AWS Code Deploy, what is the run order of the hooks for in-place deployments?

B. ApplicationStop -> BeforeInstall -> AfterInstall -> ApplicationStart

#### Question 18 (marked)

A company is building a serverless application on AWS. The application uses an AWS Lambda function to process customer orders 24 hours a day, 7 days a week. The Lambda function calls an external vendor's HTTP API to process payments.  
During load tests, a developer discovers that the external vendor payment processing API occasionally times out and returns errors. The company expects that some payment processing API calls will return errors.  
The company wants the support team to receive notifications in near real time only when the payment processing external API error rate exceed 5% of the total number of transactions in an hour. Developers need to use an existing Amazon Simple Notification Service (Amazon SNS) topic that is configured to notify the support team.  
Which solution will meet these requirements?

B. Publish custom metrics to CloudWatch that record the failures of the external payment processing API calls. Configure a CloudWatch alarm to notify the existing SNS topic when error rate exceeds the specified rate.

#### Question 19

A company is offering APIs as a service over the internet to provide unauthenticated read access to statistical information that is updated daily. The company uses Amazon API Gateway and AWS Lambda to develop the APIs. The service has become popular, and the company wants to enhance the responsiveness of the APIs.  
Which action can help the company achieve this goal?

A. Enable API caching in API Gateway.

#### Question 20

A developer wants to store information about movies. Each movie has a title, release year, and genre. The movie information also can include additional properties about the cast and production crew. This additional information is inconsistent across movies. For example, one movie might have an assistant director, and another movie might have an animal trainer.  
The developer needs to implement a solution to support the following use cases:  
For a given title and release year, get all details about the movie that has that title and release year.  
For a given title, get all details about all movies that have that title.  
For a given genre, get all details about all movies in that genre.  
Which data store configuration will meet these requirements?

A. Create an Amazon DynamoDB table. Configure the table with a primary key that consists of the title as the partition key and the release year as the sort key. Create a global secondary index that uses the genre as the partition key and the title as the sort key

#### Question 21

A developer maintains an Amazon API Gateway REST API. Customers use the API through a frontend UI and Amazon Cognito authentication.  
The developer has a new version of the API that contains new endpoints and backward-incompatible interface changes. The developer needs to provide beta access to other developers on the team without affecting customers.  
Which solution will meet these requirements with the LEAST operational overhead?

A. Define a development stage on the API Gateway API. Instruct the other developers to point the endpoints to the development stage.

#### Question 22

A developer is creating an application that will store personal health information (PHI). The PHI needs to be encrypted at all times. An encrypted Amazon RDS for MySQL DB instance is storing the data. The developer wants to increase the performance of the application by caching frequently accessed data while adding the ability to sort or rank the cached datasets.  
Which solution will meet these requirements?

Create an Amazon ElastiCache for Redis instance. Enable encryption of data in transit and at rest. Store frequently accessed data in the cache. (Redis Sorted Sets to easily implement a dashboard that keeps a list of sorted data by their rank.)

#### Question 23 (marked)

A company has a multi-node Windows legacy application that runs on premises. The application uses a network shared folder as a centralized configuration repository to store configuration files in .xml format. The company is migrating the application to Amazon EC2 instances. As part of the migration to AWS, a developer must identify a solution that provides high availability for the repository.  
Which solution will meet this requirement MOST cost-effectively?

C. Create an Amazon S3 bucket to host the repository. Migrate the existing .xml files to the S3 bucket. Update the application code to use the AWS SDK to read and write configuration files from Amazon S3 (Note: EBS is not scalable and highly-available)

#### Question 24

A company wants to deploy and maintain static websites on AWS. Each website's source code is hosted in one of several version control systems, including AWS CodeCommit, Bitbucket, and GitHub.  
The company wants to implement phased releases by using development, staging, user acceptance testing, and production environments in the AWS Cloud. Deployments to each environment must be started by code merges on the relevant Git branch. The company wants to use HTTPS for all data exchange. The company needs a solution that does not require servers to run continuously.  
Which solution will meet these requirements with the LEAST operational overhead?

A. Host each website by using AWS Amplify with a serverless backend. Conned the repository branches that correspond to each of the desired environments. Start deployments by merging code changes to a desired branch.

#### Question 25

A company is migrating an on-premises database to Amazon RDS for MySQL. The company has read-heavy workloads. The company wants to refactor the code to achieve optimum read performance for queries.  
Which solution will meet this requirement with LEAST current and future effort?

C. Deploy Amazon RDS with one or more read replicas. Modify the application code so that queries use the URL for the read replicas.

#### Question 26 (marked)

A developer is creating an application that will be deployed on IoT devices. The application will send data to a RESTful API that is deployed as an AWS Lambda function. The application will assign each API request a unique identifier. The volume of API requests from the application can randomly increase at any given time of day.  
During periods of request throttling, the application might need to retry requests. The API must be able to handle duplicate requests without inconsistencies or data loss.  
Which solution will meet these requirements?

B. Create an Amazon DynamoDB table. Store the unique identifier for each request in the table. Modify the Lambda function to check the table for the identifier before processing the request

Note: Focus on Durability not latency (thus why not ElastiCache)

#### Question 27 (marked)

A developer wants to expand an application to run in multiple AWS Regions. The developer wants to copy Amazon Machine Images (AMIs) with the latest changes and create a new application stack in the destination Region. According to company requirements, all AMIs must be encrypted in all Regions. However, not all the AMIs that the company uses are encrypted.  
How can the developer expand the application to run in the destination Region while meeting the encryption requirement?

A. Create new AMIs, and specify encryption parameters. Copy the encrypted AMIs to the destination Region. Delete the unencrypted AMIs.

Note: The best solution for meeting the encryption requirement is to create new AMIs with encryption enabled and copy them to the destination Region. By default, when an AMI is copied to another Region, it is not encrypted in the destination Region even if it is encrypted in the source Region. Therefore, the developer must create new encrypted AMIs that can be used in the destination Region. Once the new encrypted AMIs have been created, they can be copied to the destination Region. The unencrypted AMIs can then be deleted to ensure that all instances running in all Regions are using only encrypted AMIs.

#### Question 28

A company hosts a client-side web application for one of its subsidiaries on Amazon S3. The web application can be accessed through Amazon CloudFront from https://www.example.com. After a successful rollout, the company wants to host three more client-side web applications for its remaining subsidiaries on three separate S3 buckets.  
To achieve this goal, a developer moves all the common JavaScript files and web fonts to a central S3 bucket that serves the web applications. However, during testing, the developer notices that the browser blocks the JavaScript files and web fonts.  
What should the developer do to prevent the browser from blocking the JavaScript files and web fonts?

C. Create a cross-origin resource sharing (CORS) configuration that allows access to the central S3 bucket. Add the CORS configuration to the central S3 bucket.

#### Question 29

An application is processing clickstream data using Amazon Kinesis. The clickstream data feed into Kinesis experiences periodic spikes. The PutRecords API call occasionally fails and the logs show that the failed call returns the response shown below. Which techniques will help mitigate this exception? (Choose two.)

`Some image which has Kinesis Throughput Exceeded for a Shard`

A. Implement retries with exponential backoff.
C. Reduce the frequency and/or size of the requests.

#### Question 30

A company has an application that uses Amazon Cognito user pools as an identity provider. The company must secure access to user records. The company has set up multi-factor authentication (MFA). The company also wants to send a login activity notification by email every time a user logs in.  
What is the MOST operationally efficient solution that meets this requirement?

B. Create an AWS Lambda function that uses Amazon Simple Email Service (Amazon SES) to send the email notification. Add an Amazon Cognito post authentication Lambda trigger for the function.

#### Question 31

A developer has an application that stores data in an Amazon S3 bucket. The application uses an HTTP API to store and retrieve objects. When the PutObject API operation adds objects to the S3 bucket the developer must encrypt these objects at rest by using server-side encryption with Amazon S3 managed keys (SSE-S3).  
Which solution will meet this requirement?

B. Set the `x-amz-server-side-encryption` header when invoking the PutObject API operation.

#### Question 32

A developer needs to perform geographic load testing of an API. The developer must deploy resources to multiple AWS Regions to support the load testing of the API.  
How can the developer meet these requirements without additional application code?

B. Create an AWS CloudFormation template that defines the load test resources. Use the AWS CLI create-stack-set command to create a stack set in the desired Regions.

#### Question 33

A developer is creating an application that includes an Amazon API Gateway REST API in the us-east-2 Region. The developer wants to use Amazon CloudFront and a custom domain name for the API. The developer has acquired an SSL/TLS certificate for the domain from a third-party provider.  
How should the developer configure the custom domain for the application?

D. Import the SSL/TLS certificate into AWS Certificate Manager (ACM) in the us-east-1 Region. Create a DNS CNAME record for the custom domain.

#### Question 34

A developer is creating a template that uses AWS CloudFormation to deploy an application. The application is serverless and uses Amazon API Gateway, Amazon DynamoDB, and AWS Lambda.  
Which AWS service or tool should the developer use to define serverless resources in YAML?

C. AWS Serverless Application Model (AWS SAM)


#### Question 35

A developer wants to insert a record into an Amazon DynamoDB table as soon as a new file is added to an Amazon S3 bucket.  
Which set of steps would be necessary to achieve this?

B. Configure an S3 event to invoke an AWS Lambda function that inserts records into DynamoDB.

#### Question 36

A development team maintains a web application by using a single AWS CloudFormation template. The template defines web servers and an Amazon RDS database. The team uses the Cloud Formation template to deploy the Cloud Formation stack to different environments.  
During a recent application deployment, a developer caused the primary development database to be dropped and recreated. The result of this incident was a loss of data. The team needs to avoid accidental database deletion in the future.  
Which solutions will meet these requirements? (Choose two.)

A. Add a CloudFormation Deletion Policy attribute with the Retain value to the database resource.
B. Update the CloudFormation stack policy to prevent updates to the database.

#### Question 37

 A company has an Amazon S3 bucket that contains sensitive data. The data must be encrypted in transit and at rest. The company encrypts the data in the S3 bucket by using an AWS Key Management Service (AWS KMS) key. A developer needs to grant several other AWS accounts the permission to use the S3 GetObject operation to retrieve the data from the S3 bucket.  
How can the developer enforce that all requests to retrieve the data provide encryption in transit?

A. Define a resource-based policy on the S3 bucket to deny access when a request meets the condition “aws:SecureTransport”: “false”.

#### Question 38

An application that is hosted on an Amazon EC2 instance needs access to files that are stored in an Amazon S3 bucket. The application lists the objects that are stored in the S3 bucket and displays a table to the user. During testing, a developer discovers that the application does not show any objects in the list.  
What is the MOST secure way to resolve this issue?

B. Update the IAM instance profile that is attached to the EC2 instance to include the S3:ListBucket permission for the S3 bucket.

#### Question 39

A company is planning to securely manage one-time fixed license keys in AWS. The company's development team needs to access the license keys in automaton scripts that run in Amazon EC2 instances and in AWS CloudFormation stacks.  
Which solution will meet these requirements MOST cost-effectively?

C. AWS Systems Manager Parameter Store SecureString parameters

#### Question 40

A company has deployed infrastructure on AWS. A development team wants to create an AWS Lambda function that will retrieve data from an Amazon Aurora database. The Amazon Aurora database is in a private subnet in company's VPC. The VPC is named VPC1. The data is relational in nature. The Lambda function needs to access the data securely.  
Which solution will meet these requirements?

A. Create the Lambda function. Configure VPC1 access for the function. Attach a security group named SG1 to both the Lambda function and the database. Configure the security group inbound and outbound rules to allow TCP traffic on Port 3306.

#### Question 41

A developer is building a web application that uses Amazon API Gateway to expose an AWS Lambda function to process requests from clients. During testing, the developer notices that the API Gateway times out even though the Lambda function finishes under the set time limit.  
Which of the following API Gateway metrics in Amazon CloudWatch can help the developer troubleshoot the issue? (Choose two.)

B. IntegrationLatency
D. Latency

#### Question 42

A development team wants to build a continuous integration/continuous delivery (CI/CD) pipeline. The team is using AWS CodePipeline to automate the code build and deployment. The team wants to store the program code to prepare for the CI/CD pipeline.  
Which AWS service should the team use to store the program code?

C. AWS CodeCommit

#### Question 43

A developer is designing an AWS Lambda function that creates temporary files that are less than 10 MB during invocation. The temporary files will be accessed and modified multiple times during invocation. The developer has no need to save or retrieve these files in the future.  
Where should the temporary files be stored?

A. the /tmp directory

#### Question 44

A developer is designing a serverless application with two AWS Lambda functions to process photos. One Lambda function stores objects in an Amazon S3 bucket and stores the associated metadata in an Amazon DynamoDB table. The other Lambda function fetches the objects from the S3 bucket by using the metadata from the DynamoDB table. Both Lambda functions use the same Python library to perform complex computations and are approaching the quota for the maximum size of zipped deployment packages.  
What should the developer do to reduce the size of the Lambda deployment packages with the LEAST operational overhead?

B. Create a Lambda layer with the required Python library. Use the Lambda layer in both Lambda functions.

#### Question 45

A developer is writing an AWS Lambda function. The developer wants to log key events that occur while the Lambda function runs. The developer wants to include a unique identifier to associate the events with a specific function invocation. The developer adds the following code to the Lambda function:

```typescript
function handler(event, context) {}
```

Which solution will meet this requirement?

A. Obtain the request identifier from the AWS request ID field in the context object. Configure the application to write logs to standard output.

#### Question 46

A developer is working on a serverless application that needs to process any changes to an Amazon DynamoDB table with an AWS Lambda function.  
How should the developer configure the Lambda function to detect changes to the DynamoDB table?

C. Enable DynamoDB Streams on the table. Create a trigger to connect the DynamoDB stream to the Lambda function.

#### Question 47

An application uses an Amazon EC2 Auto Scaling group. A developer notices that EC2 instances are taking a long time to become available during scale-out events. The UserData script is taking a long time to run.  
The developer must implement a solution to decrease the time that elapses before an EC2 instance becomes available. The solution must make the most recent version of the application available at all times and must apply all available security updates. The solution also must minimize the number of images that are created. The images must be validated.  
Which combination of steps should the developer take to meet these requirements? (Choose two.)

A. Use EC2 Image Builder to create an Amazon Machine Image (AMI). Install all the patches and agents that are needed to manage and run the application. Update the Auto Scaling group launch configuration to use the AMI
E. Remove any commands that perform operating system patching from the UserData script

#### Question 48

A developer is creating an AWS Lambda function that needs credentials to connect to an Amazon RDS for MySQL database. An Amazon S3 bucket currently stores the credentials. The developer needs to improve the existing solution by implementing credential rotation and secure storage. The developer also needs to provide integration with the Lambda function.  
Which solution should the developer use to store and retrieve the credentials with the LEAST management overhead?

C. Store the credentials in AWS Secrets Manager. Set the secret type to Credentials for Amazon RDS database. Select the database that the secret will access. Use the default AWS Key Management Service (AWS KMS) key to encrypt the secret. Enable automatic rotation for the secret. Use the secret from Secrets Manager on the Lambda function to connect to the database.

#### Question 49

A developer has written the following IAM policy to provide access to an Amazon S3 bucket:

```
An image which has 2 statements:
Statement 1 => Allow => GetObject & PutObject => for a arn::s3:DOC-EXAMPLE-BUCKET/*
Statement 2 => Deny => Any Action => arn::s3:DOC-EXAMPLE-BUCKET/secrets
```

Which access does the policy allow regarding the s3:GetObject and s3:PutObject actions?

D. Access on all objects in the “DOC-EXAMPLE-BUCKET” bucket except on objects that start with “secrets”

#### Question 50

A developer is creating a mobile app that calls a backend service by using an Amazon API Gateway REST API. For integration testing during the development phase, the developer wants to simulate different backend responses without invoking the backend service.  
Which solution will meet these requirements with the LEAST operational overhead?

D. Use a request mapping template to select the mock integration response.

#### Question 51

A developer has a legacy application that is hosted on-premises. Other applications hosted on AWS depend on the on-premises application for proper functioning. In case of any application errors, the developer wants to be able to use Amazon CloudWatch to monitor and troubleshoot all applications from one place.  
How can the developer accomplish this?

B. Download the CloudWatch agent to the on-premises server. Configure the agent to use IAM user credentials with permissions for CloudWatch.

#### Question 52

An Amazon Kinesis Data Firehose delivery stream is receiving customer data that contains personally identifiable information. A developer needs to remove pattern-based customer identifiers from the data and store the modified data in an Amazon S3 bucket.  
What should the developer do to meet these requirements?

A. Implement Kinesis Data Firehose data transformation as an AWS Lambda function. Configure the function to remove the customer identifiers. Set an Amazon S3 bucket as the destination of the delivery stream

#### Question 53 (marked)

A developer is using an AWS Lambda function to generate avatars for profile pictures that are uploaded to an Amazon S3 bucket. The Lambda function is automatically invoked for profile pictures that are saved under the /original/ S3 prefix. The developer notices that some pictures cause the Lambda function to time out. The developer wants to implement a fallback mechanism by using another Lambda function that resizes the profile picture.  
Which solution will meet these requirements with the LEAST development effort?

B. Create an Amazon Simple Queue Service (Amazon SQS) queue. Set the SQS queue as a destination with an on failure condition for the avatar generator Lambda function. Configure the image resize Lambda function to poll from the SQS queue.

Note: might be also: A. Set the image resize Lambda function as a destination of the avatar generator Lambda function for the events that fail processing

#### Question 54 (marked)

A developer needs to migrate an online retail application to AWS to handle an anticipated increase in traffic. The application currently runs on two servers: one server for the web application and another server for the database. The web server renders webpages and manages session state in memory. The database server hosts a MySQL database that contains order details. When traffic to the application is heavy, the memory usage for the web server approaches 100% and the application slows down considerably.  
The developer has found that most of the memory increase and performance decrease is related to the load of managing additional user sessions. For the web server migration, the developer will use Amazon EC2 instances with an Auto Scaling group behind an Application Load Balancer.  
Which additional set of changes should the developer make to the application to improve the application's performance?

B. Use Amazon ElastiCache for Memcached to store and manage the session data. Use an Amazon RDS for MySQL DB instance to store the application data.

#### Question 55

An application uses Lambda functions to extract metadata from files uploaded to an S3 bucket; the metadata is stored in Amazon DynamoDB. The application starts behaving unexpectedly, and the developer wants to examine the logs of the Lambda function code for errors.  
Based on this system configuration, where would the developer find the logs?

C. Amazon CloudWatch

#### Question 56

A company is using an AWS Lambda function to process records from an Amazon Kinesis data stream. The company recently observed slow processing of the records. A developer notices that the iterator age metric for the function is increasing and that the Lambda run duration is constantly above normal.  
Which actions should the developer take to increase the processing speed? (Choose two.)

A. Increase the number of shards of the Kinesis data stream
C. Increase the memory that is allocated to the Lambda function

#### Question 57

A company needs to harden its container images before the images are in a running state. The company's application uses Amazon Elastic Container Registry (Amazon ECR) as an image registry. Amazon Elastic Kubernetes Service (Amazon EKS) for compute, and an AWS CodePipeline pipeline that orchestrates a continuous integration and continuous delivery (CI/CD) workflow.  
Dynamic application security testing occurs in the final stage of the pipeline after a new image is deployed to a development namespace in the EKS cluster. A developer needs to place an analysis stage before this deployment to analyze the container image earlier in the CI/CD pipeline.  
Which solution will meet these requirements with the MOST operational efficiency?

B. Create a new CodePipeline stage that occurs after the container image is built. Configure ECR basic image scanning to scan on image push. Use an AWS Lambda function as the action provider. Configure the Lambda function to check the scan results and to fail the pipeline if there are findings.

#### Question 58

A developer is testing a new file storage application that uses an Amazon CloudFront distribution to serve content from an Amazon S3 bucket. The distribution accesses the S3 bucket by using an origin access identity (OAI). The S3 bucket's permissions explicitly deny access to all other users.  
The application prompts users to authenticate on a login page and then uses signed cookies to allow users to access their personal storage directories. The developer has configured the distribution to use its default cache behavior with restricted viewer access and has set the origin to point to the S3 bucket. However, when the developer tries to navigate to the login page, the developer receives a 403 Forbidden error.  
The developer needs to implement a solution to allow unauthenticated access to the login page. The solution also must keep all private content secure.  
Which solution will meet these requirements?

A. Add a second cache behavior to the distribution with the same origin as the default cache behavior. Set the path pattern for the second cache behavior to the path of the login page, and make viewer access unrestricted. Keep the default cache behavior's settings unchanged

#### Question 59 (marked)

A developer is using AWS Amplify Hosting to build and deploy an application. The developer is receiving an increased number of bug reports from users. The developer wants to add end-to-end testing to the application to eliminate as many bugs as possible before the bugs reach production.  
Which solution should the developer implement to meet these requirements?

C. Add a test phase to the `amplify.yml` build settings for the application.

#### Question 60

An ecommerce company is using an AWS Lambda function behind Amazon API Gateway as its application tier. To process orders during checkout, the application calls a POST API from the frontend. The POST API invokes the Lambda function asynchronously. In rare situations, the application has not processed orders. The Lambda application logs show no errors or failures.  
What should a developer do to solve this problem?

B. Create and inspect the Lambda dead-letter queue. Troubleshoot the failed functions. Reprocess the events

#### Question 61

A company is building a web application on AWS. When a customer sends a request, the application will generate reports and then make the reports available to the customer within one hour. Reports should be accessible to the customer for 8 hours. Some reports are larger than 1 MB. Each report is unique to the customer. The application should delete all reports that are older than 2 days.  
Which solution will meet these requirements with the LEAST operational overhead?

C. Generate the reports and then store the reports in an Amazon S3 bucket that uses server-side encryption. Generate a presigned URL that contains an expiration date Provide the URL to customers through the web application. Add S3 Lifecycle configuration rules to the S3 bucket to delete old reports.

#### Question 62

A company has deployed an application on AWS Elastic Beanstalk. The company has configured the Auto Scaling group that is associated with the Elastic Beanstalk environment to have five Amazon EC2 instances. If the capacity is fewer than four EC2 instances during the deployment, application performance degrades. The company is using the all-at-once deployment policy.  
What is the MOST cost-effective way to solve the deployment issue?

C. Change the deployment policy to rolling with additional batch. Specify a batch size of 1.

#### Question 63 (marked)
A developer is incorporating AWS X-Ray into an application that handles personal identifiable information (PII). The application is hosted on Amazon EC2 instances. The application trace messages include encrypted PII and go to Amazon CloudWatch. The developer needs to ensure that no PII goes outside of the EC2 instances.  
Which solution will meet these requirements?

A. Manually instrument the X-Ray SDK in the application code. (Most Voted)
B. Use the X-Ray auto-instrumentation agent. (IDK, but from reading it has nothing on configuration for PII removal)

Note: Option A sounds correct

#### Question 64

A developer is migrating some features from a legacy monolithic application to use AWS Lambda functions instead. The application currently stores data in an Amazon Aurora DB cluster that runs in private subnets in a VPC. The AWS account has one VPC deployed. The Lambda functions and the DB cluster are deployed in the same AWS Region in the same AWS account.  
The developer needs to ensure that the Lambda functions can securely access the DB cluster without crossing the public internet.  
Which solution will meet these requirements?

D. Configure the VPC, subnets, and a security group for the Lambda functions

#### Question 65

A developer is building a new application on AWS. The application uses an AWS Lambda function that retrieves information from an Amazon DynamoDB table. The developer hard coded the DynamoDB table name into the Lambda function code. The table name might change over time. The developer does not want to modify the Lambda code if the table name changes.  
Which solution will meet these requirements MOST efficiently?

A. Create a Lambda environment variable to store the table name. Use the standard method for the programming language to retrieve the variable.

#### Question 66

A company has a critical application on AWS. The application exposes an HTTP API by using Amazon API Gateway. The API is integrated with an AWS Lambda function. The application stores data in an Amazon RDS for MySQL DB instance with 2 virtual CPUs (vCPUs) and 64 GB of RAM.  
  
Customers have reported that some of the API calls return HTTP 500 Internal Server Error responses. Amazon CloudWatch Logs shows errors for “too many connections.” The errors occur during peak usage times that are unpredictable.  
  
The company needs to make the application resilient. The database cannot be down outside of scheduled maintenance hours.  
  
Which solution will meet these requirements?

B. Use Amazon RDS Proxy to create a proxy that connects to the DB instance. Update the Lambda function to connect to the proxy.

#### Question 67

A company has installed smart meters in all its customer locations. The smart meters measure power usage at 1-minute intervals and send the usage readings to a remote endpoint for collection. The company needs to create an endpoint that will receive the smart meter readings and store the readings in a database. The company wants to store the location ID and timestamp information.  
  
The company wants to give its customers low-latency access to their current usage and historical usage on demand. The company expects demand to increase significantly. The solution must not impact performance or include downtime while scaling.  
  
Which solution will meet these requirements MOST cost-effectively?

B. Store the smart meter readings in an Amazon DynamoDB table. Create a composite key by using the location ID and timestamp columns. Use the columns to filter on the customers' data

#### Question 68

A company is building a serverless application that uses AWS Lambda functions. The company needs to create a set of test events to test Lambda functions in a development environment. The test events will be created once and then will be used by all the developers in an IAM developer group. The test events must be editable by any of the IAM users in the IAM developer group.  
  
Which solution will meet these requirements?

B. Create the test events. Configure the event sharing settings to make the test events shareable.

#### Question 69

A developer is configuring an application's deployment environment in AWS CodePipeline. The application code is stored in a GitHub repository. The developer wants to ensure that the repository package's unit tests run in the new deployment environment. The developer has already set the pipeline's source provider to GitHub and has specified the repository and branch to use in the deployment.  
  
Which combination of steps should the developer take next to meet these requirements with the LEAST overhead? (Choose two.)

B. Create an AWS CodeBuild project. Add the repository package's build and test commands to the project's buildspec
D. Add an action to the source stage. Specify the newly created project as the action provider. Specify the build artifact as the action's input artifact.

#### Question 70 (marked)

An engineer created an A/B test of a new feature on an Amazon CloudWatch Evidently project. The engineer configured two variations of the feature (Variation A and Variation B) for the test. The engineer wants to work exclusively with Variation A. The engineer needs to make updates so that Variation A is the only variation that appears when the engineer hits the application's endpoint.  
  
Which solution will meet this requirement?

A. Add an override to the feature. Set the identifier of the override to the engineer's user ID. Set the variation to Variation A

#### Question 71

A developer is working on an existing application that uses Amazon DynamoDB as its data store. The DynamoDB table has the following attributes: partNumber (partition key), vendor (sort key), description, productFamily, and productType. When the developer analyzes the usage patterns, the developer notices that there are application modules that frequently look for a list of products based on the productFamily and productType attributes.  
  
The developer wants to make changes to the application to improve performance of the query operations.  
  
Which solution will meet these requirements?

A. Create a global secondary index (GSI) with productFamily as the partition key and productType as the sort key.

#### Question 72 (marked)

A developer creates a VPC named VPC-A that has public and private subnets. The developer also creates an Amazon RDS database inside the private subnet of VPC-A. To perform some queries, the developer creates an AWS Lambda function in the default VPC. The Lambda function has code to access the RDS database. When the Lambda function runs, an error message indicates that the function cannot connect to the RDS database.  
  
How can the developer solve this problem?

B. Redeploy the Lambda function in the same subnet as the RDS instance. Ensure that the RDS security group allows traffic from the Lambda function.

#### Question 73

A company runs an application on AWS. The company deployed the application on Amazon EC2 instances. The application stores data on Amazon Aurora.  
  
The application recently logged multiple application-specific custom DECRYP_ERROR errors to Amazon CloudWatch logs. The company did not detect the issue until the automated tests that run every 30 minutes failed. A developer must implement a solution that will monitor for the custom errors and alert a development team in real time when these errors occur in the production environment.  
  
Which solution will meet these requirements with the LEAST operational overhead?

C. Use Amazon CloudWatch Logs to create a metric filter that has a filter pattern for DECRYP_ERROR. Create a CloudWatch alarm on this metric for a threshold >=1. Configure the alarm to send Amazon Simple Notification Service (Amazon SNS) notifications.

#### Question 74 (marked)

A developer created an AWS Lambda function that accesses resources in a VPC. The Lambda function polls an Amazon Simple Queue Service (Amazon SQS) queue for new messages through a VPC endpoint. Then the function calculates a rolling average of the numeric values that are contained in the messages. After initial tests of the Lambda function, the developer found that the value of the rolling average that the function returned was not accurate.  
  
How can the developer ensure that the function calculates an accurate rolling average?

B. Modify the function to store the values in Amazon ElastiCache. When the function initializes, use the previous values from the cache to calculate the rolling average

[Link](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate-dva-c02/view/8/)

#### Question 75 (marked)

A developer is writing unit tests for a new application that will be deployed on AWS. The developer wants to validate all pull requests with unit tests and merge the code with the main branch only when all tests pass.  
  
The developer stores the code in AWS CodeCommit and sets up AWS CodeBuild to run the unit tests. The developer creates an AWS Lambda function to start the CodeBuild task. The developer needs to identify the CodeCommit events in an Amazon EventBridge event that can invoke the Lambda function when a pull request is created or updated.  
  
Which CodeCommit event will meet these requirements?

C. pullRequestSourceBranchUpdated, pullRequestCreated

#### Question 76 (marked)

A developer deployed an application to an Amazon EC2 instance. The application needs to know the public IPv4 address of the instance.  
  
How can the application find this information?

A. Query the instance metadata from http://169.254.169.254/latest/meta-data/.


#### Question 77

An application under development is required to store hundreds of video files. The data must be encrypted within the application prior to storage, with a unique key for each video file.  
  
How should the developer code the application?

C. Use the KMS GenerateDataKey API to get a data key. Encrypt the data with the data key. Store the encrypted data key and data.

#### Question 78

A company is planning to deploy an application on AWS behind an Elastic Load Balancer. The application uses an HTTP/HTTPS listener and must access the client IP addresses.  
  
Which load-balancing solution meets these requirements?

A. Use an Application Load Balancer and the X-Forwarded-For headers.

#### Question 79

A developer wants to debug an application by searching and filtering log data. The application logs are stored in Amazon CloudWatch Logs. The developer creates a new metric filter to count exceptions in the application logs. However, no results are returned from the logs.  
  
What is the reason that no filtered results are being returned?

B. CloudWatch Logs only publishes metric data for events that happen after the filter is created.

#### Question 80

A company is planning to use AWS CodeDeploy to deploy an application to Amazon Elastic Container Service (Amazon ECS). During the deployment of a new version of the application, the company initially must expose only 10% of live traffic to the new version of the deployed application. Then, after 15 minutes elapse, the company must route all the remaining live traffic to the new version of the deployed application.  
  
Which CodeDeploy predefined configuration will meet these requirements?

A. CodeDeployDefault.ECSCanary10Percent15Minutes

# From [Exam Topics DVA-C01](https://www.examtopics.com/exams/amazon/aws-certified-developer-associate/)

#### Question 1

A gaming website gives users the ability to trade game items with each other on the platform. The platform requires both users' records to be updated and persisted in one transaction. If any update fails, the transaction must roll back.  
Which AWS solution can provide the transactional capability that is required for this feature?

C. Amazon DynamoDB with reads and writes made by using Transact* operations

#### Question 2

A developer has created a Java application that makes HTTP requests directly to AWS services. Application logging shows 5xx HTTP response codes that occur at irregular intervals. The errors are affecting users.  
How should the developer update the application to improve the application's resiliency?

B. Use the AWS SDK for Java to interact with AWS APIs.

#### Question 3

A global company has a mobile app with static data stored in an Amazon S3 bucket in the us-east-1 Region. The company serves the content through an Amazon  
CloudFront distribution. The company is launching the mobile app in South Africa. The data must reside in the af-south-1 Region. The company does not want to deploy a specific mobile client for South Africa.  
What should the company do to meet these requirements?

B. Create a Lambda@Edge function. Associate the Lambda@Edge function as an origin request trigger with the CloudFront distribution to change the S3 origin Region.

#### Question 4

A developer is testing an AWS Lambda function by using the AWS Serverless Application Model (AWS SAM) local CLI. The application that is implemented by the  
Lambda function makes several AWS API calls by using the AWS software development kit (SDK). The developer wants to allow the function to make AWS API calls in a test AWS account from the developer's laptop.  
What should the developer do to meet these requirements?

B. Add a test profile by using the aws configure command with the --profile option. Run AWS SAM by using the sam local invoke command with the -profile option.

#### Question 5

A developer designed an application on an Amazon EC2 instance. The application makes API requests to objects in an Amazon S3 bucket.  
Which combination of steps will ensure that the application makes the API requests in the MOST secure manner? (Choose two.)

B. Create an IAM role that has permissions to the S3 bucket.
C. Add the IAM role to an instance profile. Attach the instance profile to the EC2 instance.

#### Question 6 (marked)

A developer is configuring an Amazon CloudFront distribution for a new application to provide encryption in transit. The application is running in the eu-west-1  
Region. The developer creates a new certificate in AWS Certificate Manager (ACM) in eu-west-1, but the certificate is not visible in the CloudFront distribution settings.  
What should the developer do to fix this problem?

B. Create the certificate in the eu-west-1 Region. Ensure that the alternate domain name (CNAME) in the distribution settings matches the domain name in the certificate.

*Note:* there is a typo somewhere. To import an ACM into Cloudfront, the ACM needs to be in the us-east-1 region:

#### Question 7

A developer is building an application that runs behind an Application Load Balancer (ALB). The ALB is configured as the origin for an Amazon CloudFront distribution. Users will log in to the application by using their social media accounts.  
How can the developer authenticate users?

B. Configure the ALB to use Amazon Cognito as one of the authentication providers.

#### Question 8 (marked)

A company has an application that analyzes photographs. A developer is preparing the application for deployment to Amazon EC2 instances. The application's image analysis functions require a mix of GPU instances and CPU instances that run on Amazon Linux. The developer needs to add code to the application so that the functions can determine whether they are running on a GPU instance.  
What should the functions do to obtain this information?

D. Retrieve the instance type from the instance metadata.

#### Question 9

A company has an application that uses Amazon Cognito user pools as an identity provider. The company must secure access to user records. The company has set up multi-factor authentication (MFA). The company also wants to send a login activity notification by email every time a user logs in.  
What is the MOST operationally efficient solution that meets this requirement?

B. Create an AWS Lambda function that uses Amazon Simple Email Service (Amazon SES) to send the email notification. Add an Amazon Cognito post authentication Lambda trigger for the function.

#### Question 10 (marked)

A company hosts a three-tier web application on AWS behind an Amazon CloudFront distribution. A developer wants a dashboard to monitor error rates and anomalies of the CloudFront distribution with the shortest possible refresh interval.  
Which combination of slops should the developer take to meet these requirements? (Choose two.)

A. Activate real-time logs on the CloudFront distribution. Create a stream in Amazon Kinesis Data Streams.
C. Configure Amazon Kinesis Data Streams to deliver logs to Amazon OpenSearch Service (Amazon Elasticsearch Service). Create a dashboard in OpenSearch Dashboards (Kibana).

#### Question 11

A developer creates a customer managed key for multiple AWS users to encrypt data in Amazon S3. The developer configures Amazon Simple Notification  
Service (Amazon SNS) to publish a message if key deletion is scheduled. The developer needs to preserve any SNS messages that cannot be delivered so that those messages can be reprocessed.  
Which AWS service or feature should the developer use to meet this requirement?

C. Amazon Simple Queue Service (Amazon SQS)

#### Question 12 (marked)

A developer needs to deploy an application to AWS Elastic Beanstalk for a company. The application consists of a single Docker image. The company's automated continuous integration and continuous delivery (CI/CD) process builds the Docker image and pushes the image to a public Docker registry.  
How should the developer deploy the application to Elastic Beanstalk?

B. Create a docker-compose.yml file. Use the Elastic Beanstalk CLI to deploy the application.

Note: After testing your container locally, deploy it to an Elastic Beanstalk environment. Elastic Beanstalk uses the docker-compose.yml file to pull and run your image if you are using Docker Compose. Otherwise, Elastic Beanstalk uses the Dockerrun.aws.json instead.

#### Question 13

A company is using AWS CodeDeploy for all production deployments. A developer has an Amazon Elastic Container Service (Amazon ECS) application that uses the CodeDeployDefault.ECSAIIAtOnce configuration. The developer needs to update the production environment in increments of 10% until the entire production environment is updated.  
Which CodeDeploy configuration should the developer use to meet these requirements?

B. CodeDeployDefault.ECSLinear10PercentEvery3Minutes

#### Question 14 (marked)

A company is using AWS Elastic Beanstalk to deploy a three-tier application. The application uses an Amazon RDS DB instance as the database tier. The company wants to decouple the DB instance from the Elastic Beanstalk environment.  
Which combination of steps should a developer lake to meet this requirement? (Choose two.)

A. Create a new Elastic Beanstalk environment that connects to the DB instance.
C. Use the Elastic Beanstalk CLI to decouple the DB instance.

#### Question 15 (marked)

A company has point-of-sale devices across thousands of retail shops that synchronize sales transactions with a centralized system. The system includes an  
Amazon API Gateway API that exposes an AWS Lambda function. The Lambda function processes the transactions and stores the transactions in Amazon RDS for MySQL. The number of transactions increases rapidly during the day and is near zero at night.  
How can a developer increase the elasticity of the system MOST cost-effectively?

D. Create an Amazon Simple Queue Service (Amazon SQS) queue. Publish transactions to the queue. Set the queue to invoke the Lambda function. Set the reserved concurrency of the Lambda function to be less than the number of database connections

Note: Read Replicas are for read, not for transactions

#### Question 16

A developer is writing an AWS Lambda function. The Lambda function needs to access items that are stored in an Amazon DynamoDB table.  
What is the MOST secure way to configure this access for the Lambda function?

C. Create an IAM policy that allows access to the DynamoDB table. Attach this policy to the Lambda function's IAM role.

#### Question 17

A developer is implementing user authentication and authorization for a web application that is hosted on an Amazon EC2 instance. The developer needs to ensure that the user credentials are encrypted and secure when they are stored and transmitted.  
Which solution will meet these requirements?

C. Use Amazon Cognito to configure a user pool. Use the Amazon Cognito API to authenticate and authorize the users.

#### Question 18

A company that has multiple offices uses an Amazon DynamoDB table to store employee payroll information. Item attributes consist of employee names, office identifiers, and cumulative daily hours worked The most frequently used query extracts a report of an alphabetical subset of employees for a specific office.  
Which design of the DynamoDB table primary key will have the MINIMUM performance impact?

A. Partition key on the office identifier and sort key on the employee name

#### Question 19

A company hosts a microservices application that uses Amazon API Gateway. AWS Lambda, Amazon Simple Queue Service (Amazon SQS), and Amazon  
DynamoDB. One of the Lambda functions adds messages to an SQS FIFO queue.  
When a developer checks the application logs, the developer finds a few duplicated items in a DynamoDB table. The items were inserted by another polling function that processes messages from the queue.  
What is the MOST likely cause of this issue?

D. The polling function timeout is greater than the queue visibility timeout.

#### Question 20 (marked)

A development team has been using a builder server that is hosted on an Amazon EC2 instance to perform builds and deployments for the last 3 months. The  
EC2 instance's instance profile uses an IAM role that contains the Administrator Access managed policy. The development team must replace that policy with a policy that provides only the required permissions.  
What is the FASTEST way to create a custom IAM policy for the EC2 instance to meet this requirement?

B. Create a new IAM policy that includes all actions that AWS CloudTrail recorded for the IAM role in the last 3 months

Note: Athena is an option, but you can query on Cloudtrail anyway, on Athena you have to setup

#### Question 21

A developer needs to write an AWS CloudFormation template on a local machine and deploy a CloudFormation stack to AWS.  
What must the developer do to complete these tasks?

C. Install the AWS CLI. Configure the AWS CLI by using an IAM user access key and secret key.

#### Question 22

A developer is working on a web application that runs on Amazon Elastic Container Service (Amazon ECS) and uses an Amazon DynamoDB table to store data.  
The application performs a large number of read requests against a small set of the table data.  
How can the developer improve the performance of these requests? (Choose two.)

B. Create a DynamoDB Accelerator (DAX) cluster. Configure the application to use the DAX cluster for DynamoDB requests.
D. Increase the read capacity of the DynamoDB table.

#### Question 23

A developer needs to use Amazon DynamoDB to store customer orders. The developer's company requires all customer data to be encrypted at rest with a key that the company generates.  
What should the developer do to meet these requirements?

B. Store the key by using AWS Key Management Service (AWS KMS). Choose an AWS KMS customer managed key during creation of the DynamoDB table. Provide the Amazon Resource Name (ARN) of the AWS KMS key.

#### Question 24

A developer is creating a solution to track an account's Amazon S3 buckets over time. The developer has created an AWS Lambda function that will run on a schedule. The function will list the account's S3 buckets and will store the list in an Amazon DynamoDB table. The developer receives a permissions error when the developer runs the function with the AWSLambdaBasicExecutionRole AWS managed policy.  
Which combination of permissions should the developer use to resolve this error? (Choose two.)

B. Permission for the Lambda function to list buckets in Amazon S3
C. Permission for the Lambda function to write in DynamoDB

#### Question 25 (marked)

A company is adding items to an Amazon DynamoDB table from an AWS Lambda function that is written in Python. A developer needs to implement a solution that inserts records in the DynamoDB table and performs automatic retry when the insert fails.  
Which solution meets these requirements with MINIMUM code changes?

D. Use the AWS software development kit (SDK) for Python (boto3) to call the PutItem operation

#### Question 26

A developer is writing an AWS Lambda function. The developer wants to log key events that occur during the Lambda function and include a unique identifier to associate the events with a specific function invocation.  
Which of the following will help the developer accomplish this objective?

A. Obtain the request identifier from the Lambda context object. Architect the application to write logs to the console.

#### Question 27 (marked)

A company experienced partial downtime during the last deployment of a new application. AWS Elastic Beanstalk split the environment's Amazon EC2 instances into batches and deployed a new version one batch at a time after taking them out of service. Therefore, full capacity was not maintained during deployment.  
The developer plans to release a new version of the application, and is looking for a policy that will maintain full capacity and minimize the impact of the failed deployment.  
Which deployment policy should the developer use?

A. Immutable

Note: impact is minimized through immutable, rolling back with additional batch is slower

#### Question 28

A company is providing services to many downstream consumers. Each consumer may connect to one or more services. This has resulted in a complex architecture that is difficult to manage and does not scale well. The company needs a single interface to manage these services to consumers.  
Which AWS service should be used to refactor this architecture?

D. Amazon API Gateway

#### Question 29

When a Developer tries to run an AWS CodeBuild project, it raises an error because the length of all environment variables exceeds the limit for the combined maximum of characters.  
What is the recommended solution?

D. Use AWS Systems Manager Parameter Store to store large numbers of environment variables.

#### Question 30

A Development team decides to adopt a continuous integration/continuous delivery (CI/CD) process using AWS CodePipeline and AWS CodeCommit for a new application. However, management wants a person to review and approve the code before it is deployed to production.  
How can the Development team add a manual approver to the CI/CD pipeline?

D. Add an approval action to the pipeline. Configure the approval action to publish to an Amazon SNS topic when approval is required. The pipeline execution will stop and wait for an approval.

#### Question 31

A Developer is migrating an on-premises application to AWS. The application currently takes user uploads and saves them to a local directory on the server. All uploads must be saved and made immediately available to all instances in an Auto Scaling group.  
Which approach will meet these requirements?

B. Use Amazon S3 and rearchitect the application so all uploads are placed in S3.

#### Question 32

A developer is creating a script to automate the deployment process for a serverless application. The developer wants to use an existing AWS Serverless  
Application Model (AWS SAM) template for the application.  
What should the developer use for the project? (Choose two.)

A. Call aws cloudformation package to create the deployment package. Call aws cloudformation deploy to deploy the package afterward.
B. Call sam package to create the deployment package. Call sam deploy to deploy the package afterward.

#### Question 33

A developer has built a market application that stores pricing data in Amazon DynamoDB with Amazon ElastiCache in front. The prices of items in the market change frequently. Sellers have begun complaining that, after they update the price of an item, the price does not actually change in the product listing.  
What could be causing this issue?

A. The cache is not being invalidated when the price of the item is changed

#### Question 34 (marked)

The developer is creating a web application that collects highly regulated and confidential user data through a POST request. The web application is served through Amazon CloudFront. User names and phone numbers must be encrypted at the edge and must remain encrypted throughout the entire application stack.  
What is the MOST secure way to meet these requirements?

D. Use field-level encryption on CloudFront. Link: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/data-protection-summary.html

#### Question 35 (marked)

A Developer has been asked to create an AWS Lambda function that is triggered any time updates are made to items in an Amazon DynamoDB table. The function has been created, and appropriate permissions have been added to the Lambda execution role. Amazon DynamoDB streams have been enabled for the table, but the function is still not being triggered.  
Which option would enable DynamoDB table updates to trigger the Lambda function?

B. Configure event source mapping for the Lambda function


#### Question 36

A company maintains a REST service using Amazon API Gateway and the API Gateway native API key validation. The company recently launched a new registration page, which allows users to sign up for the service. The registration page creates a new API key using CreateApiKey and sends the new key to the user. When the user attempts to call the API using this key, the user receives a 403 Forbidden error. Existing users are unaffected and can still call the API.  
What code updates will grant these new users access to the API?

D. The createUsagePlanKey method must be called to associate the newly created API key with the correct usage plan.

#### Question 37

An application uploads photos to an Amazon S3 bucket. Each photo that is uploaded to the S3 bucket must be resized to a thumbnail image by the application.  
Each thumbnail image is uploaded with a new name in the same S3 bucket.  
Which AWS service can a developer configure to directly process each single S3 event for each S3 object upload?

D. AWS Lambda

#### Question 38

A company is running a Docker application on Amazon ECS. The application must scale based on user load in the last 15 seconds.  
How should a Developer instrument the code so that the requirement can be met?

B. Create a high-resolution custom Amazon CloudWatch metric for user activity data, then publish data every 5 seconds

#### Question 39

Where should the appspec.yml file be placed in order for AWS CodeDeploy to work?

A. In the root of the application source code directory structure

#### Question 40 (marked)

A Developer is working on an application that handles 10MB documents that contain highly-sensitive data. The application will use AWS KMS to perform client- side encryption.  
What steps must be followed?

D. Invoke the GenerateDataKey API to retrieve the plaintext version of the data encryption key to encrypt the data

#### Question 41

An application uses Amazon Kinesis Data Streams to ingest and process large streams of data records in real time. Amazon EC2 instances consume and process the data from the shards of the Kinesis data stream by using Amazon Kinesis Client Library (KCL). The application handles the failure scenarios and does not require standby workers. The application reports that a specific shard is receiving more data than expected. To adapt to the changes in the rate of data flow, the  
`hot` shard is resharded.  
Assuming that the initial number of shards in the Kinesis data stream is 4, and after resharding the number of shards increased to 6, what is the maximum number of EC2 instances that can be deployed to process data from all the shards?

B. 6

#### Question 42

A Company runs continuous integration/continuous delivery (CI/CD) pipelines for its application on AWS CodePipeline. A Developer must write unit tests and run them as part of the pipelines before staging the artifacts for testing.  
How should the Developer incorporate unit tests as part of CI/CD pipelines?

B. Update the AWS CodeBuild specification to include a phase for running unit tests

#### Question 43

A Developer has written an application that runs on Amazon EC2 instances and generates a value every minute. The Developer wants to monitor and graph the values generated over time without logging in to the instance each time.  
Which approach should the Developer use to achieve this goal?

C. Publish each generated value as a custom metric to Amazon CloudWatch using available AWS SDKs.

#### Question 44

A developer is trying to get data from an Amazon DynamoDB table called demoman-table. The developer configured the AWS CLI to use a specific IAM user's credentials and executed the following command:
`aws dynamodb get-item --table-name demomam-table --key {"id": {"N": "1993"}}`
The command returned errors and no rows were returned.  
What is the MOST likely cause of these issues?

D. The IAM user needs an associated policy with read access to demoman-table.

#### Question 45 (marked)

A Development team is working on a case management solution that allows medical claims to be processed and reviewed. Users log in to provide information related to their medical and financial situations.  
As part of the application, sensitive documents such as medical records, medical imaging, bank statements, and receipts are uploaded to Amazon S3. All documents must be securely transmitted and stored. All access to the documents must be recorded for auditing.  
What is the MOST secure approach?

D. Use client-side encryption/decryption with Amazon S3 and AWS KMS.

#### Question 46

A developer is planning to use an Amazon API Gateway and AWS Lambda to provide a REST API. The developer will have three distinct environments to manage: development, test, and production.  
How should the application be deployed while minimizing the number of resources to manage?

C. Create one API Gateway with multiple stages with one Lambda function with multiple aliases.

#### Question 47

An application needs to use the IP address of the client in its processing. The application has been moved into AWS and has been placed behind an Application  
Load Balancer (ALB). However, all the client IP addresses now appear to be the same. The application must maintain the ability to scale horizontally.  
Based on this scenario, what is the MOST cost-effective solution to this problem?

C. Alter the application code to inspect the X-Forwarded-For header. Ensure that the code can work properly if a list of IP addresses is passed in the header.

#### Question 48

A developer tested an application locally and then deployed it to AWS Lambda. While testing the application remotely, the Lambda function fails with an access denied message.  
How can this issue be addressed?

A. Update the Lambda function's execution role to include the missing permissions.

#### Question 49

A Developer must analyze performance issues with production-distributed applications written as AWS Lambda functions. These distributed Lambda applications invoke other components that make up the applications.  
How should the Developer identify and troubleshoot the root cause of the performance issues in production?

C. Use AWS X-Ray, then examine the segments and errors.

#### Question 50

A company is building a compute-intensive application that will run on a fleet of Amazon EC2 instances. The application uses attached Amazon EBS disks for storing data. The application will process sensitive information and all the data must be encrypted.  
What should a Developer do to ensure the data is encrypted on disk without impacting performance?

A. Configure the Amazon EC2 instance fleet to use encrypted EBS volumes for storing data

#### Question 51

A Developer is working on a serverless project based in Java. Initial testing shows a cold start takes about 8 seconds on average for AWS Lambda functions.  
What should the Developer do to reduce the cold start time? (Choose two.)

B. Reduce the deployment package by including only needed modules from the AWS SDK for Java.
C. Increase the memory allocation setting for the Lambda function

#### Question 52

A company runs an e-commerce website that uses Amazon DynamoDB where pricing for items is dynamically updated in real time. At any given time, multiple updates may occur simultaneously for pricing information on a particular product. This is causing the original editor's changes to be overwritten without a proper review process.  
Which DynamoDB write option should be selected to prevent this overwriting?

B. Conditional writes

#### Question 53

A developer is storing JSON files in an Amazon S3 bucket. The developer wants to securely share an object with a specific group of people.  
How can the developer securely provide temporary access to the objects that are stored in the S3 bucket?

B. Use the AWS software development kit (SDK) to generate a presigned URL. Provide the presigned URL.

#### Question 54

A front-end web application is using Amazon Cognito user pools to handle the user authentication flow. A developer is integrating Amazon DynamoDB into the application using the AWS SDK for JavaScript.  
How would the developer securely call the API without exposing the access or secret keys?

A. Configure Amazon Cognito identity pools and exchange the JSON Web Token (JWT) for temporary credentials.

#### Question 55

A Developer must build an application that uses Amazon DynamoDB. The requirements state that the items being stored in the DynamoDB table will be 7KB in size and that reads must be strongly consistent. The maximum read rate is 3 items per second, and the maximum write rate is 10 items per second.  
How should the Developer size the DynamoDB table to meet these requirements?

B. Read: 6 read capacity units Write: 70 write capacity units

#### Question 56

A company needs to ingest terabytes of data each hour from thousands of sources that are delivered almost continually throughout the day. The volume of messages generated varies over the course of the day. Messages must be delivered in real time for fraud detection and live operational dashboards.  
Which approach will meet these requirements?

D. Use Amazon Kinesis Data Streams with Kinesis Client Library to ingest and deliver messages

#### Question 57

A developer is debugging an AWS Lambda function behind an Amazon API Gateway. Whenever the API Gateway endpoint is called, HTTP status code 200 is returned even though AWS Lambda is recording a 4xx error.  
What change needs to be made to return a proper error code through the API Gateway?

B. Use a Lambda proxy integration to return HTTP codes and headers

#### Question 58

For a deployment using AWS CodeDeploy, what is the run order of the hooks for in-place deployments?

B. Application Stop -> Before Install -> After Install -> Application Start

#### Question 59

A developer is using Amazon S3 as the event source that invokes a Lambda function when new objects are created in the bucket. The event source mapping information is stored in the bucket notification configuration. The developer is working with different versions of the Lambda function, and has a constant need to update notification configuration so that Amazon S3 invokes the correct version.  
What is the MOST efficient and effective way to achieve mapping between the S3 event and Lambda?

C. Use a Lambda alias.

#### Question 60

A company has a multi-tier application that uses Amazon API Gateway, AWS Lambda, and Amazon RDS. The company wants to investigate a slow response time to calls that come from the API Gateway API.  
What is the MOST operationally efficient way for the company to determine which internal call is causing the slow response times?

B. Use AWS X-Ray.

#### Question 61

A developer is deploying an application that will store files in an Amazon S3 bucket. The files must be encrypted at rest. The developer wants to automatically replicate the files to an S3 bucket in a different AWS Region for disaster recovery.  
How can the developer accomplish this task with the LEAST amount of configuration?

A. Encrypt the files by using server-side encryption with S3 managed encryption keys (SSE-S3). Enable S3 bucket replication.


#### Question 62 (marked)

A serverless application is using AWS Step Functions to process data and save it to a database. The application needs to validate some data with an external service before saving the data. The application will call the external service from an AWS Lambda function, and the external service will take a few hours to validate the data. The external service will respond to a webhook when the validation is complete.  
A developer needs to pause the Step Functions workflow and wait for the response from the external service.  
What should the developer do to meet this requirement?

A. Use the .wait ForTaskToken option in the Lambda function task state. Pass the token in the body.

#### Question 63

A developer must use AWS X-Ray to monitor an application that is running on an Amazon EC2 instance. The developer has prepared the application by using the  
X-Ray SDK.  
What should the developer do to perform the monitoring?

B. Install the X-Ray daemon. Assign an IAM role to the EC2 instance with a policy that allows writes to X-Ray.

#### Question 64

A developer is designing a full-stack serverless application. Files for the website are stored in an Amazon S3 bucket. AWS Lambda functions that use Amazon  
API Gateway endpoints return results from an Amazon DynamoDB table.  
The developer must create a solution that securely provides registration and authentication for the application while minimizing the amount of configuration.  
Which solution meets these requirements?

A. Create an Amazon Cognito user pool and an app client. Configure the app client to use the user pool and provide the hosted web UI provided for sign-up and sign-in.

#### Question 65 (marked)

A company has an application that writes files to an Amazon S3 bucket. Whenever there is a new file, an S3 notification event invokes an AWS Lambda function to process the file. The Lambda function code works as expected. However, when a developer checks the Lambda function logs, the developer finds that multiple invocations occur for every file.  
What is causing the duplicate entries?

C. Amazon S3 is delivering the same event multiple times.
#### Question 66

A developer needs to use the AWS CLI on an on-premises development server temporarily to access AWS services while performing maintenance. The developer needs to authenticate to AWS with their identity for several hours.  
What is the MOST secure way to call AWS CLI commands with the developer's IAM identity?

D. Run the get-session-token CLI command with the developer's IAM user. Use the returned credentials to call the CLI

#### Question 67

An AWS Lambda function accesses two Amazon DynamoDB tables. A developer wants to improve the performance of the Lambda function by identifying bottlenecks in the function.  
How can the developer inspect the timing of the DynamoDB API calls?

D. Enable AWS X-Ray tracing for the function. View the traces from the X-Ray service.

#### Question 68

A developer deployed an application to an Amazon EC2 instance. The application needs to know the public IPv4 address of the instance.  
How can the application find this information?

A. Query the instance metadata from http://169.254.169.254/latest/meta-data/

#### Question 69

A developer is designing an AWS Lambda function to perform a maintenance activity. The developer will use Amazon EventBridge (Amazon CloudWatch Events) to invoke the function on an hourly schedule. The developer wants the function to log information at different levels of detail according to the value of a log level variable. The developer must design the function so that the log level can be set without requiring a change to the function code.  
Which solution will meet these requirements?

B. Set the log level in a Lambda environment variable

#### Question 70

A developer is creating a serverless application that uses an AWS Lambda function The developer will use AWS CloudFormation to deploy the application The application will write logs to Amazon CloudWatch Logs. The developer has created a log group in a CloudFormation template for the application to use. The developer needs to modify the CloudFormation template to make the name of the log group available to the application at runtime.  
Which solution will meet this requirement?

D. Pass the log group's Amazon Resource Name (ARN) as an environment variable to the Lambda function.

#### Question 71

A company is running an application on Amazon Elastic Container Service (Amazon ECS). When the company deploys a new version of the application, the company initially needs to expose 10% of live traffic to the new version. After a period of time, the company needs to immediately route all the remaining live traffic to the new version.  
Which ECS deployment should the company use to meet these requirements?

B. Blue/green with canary

#### Question 72

A microservices application is deployed across multiple containers in Amazon Elastic Container Service (Amazon ECS). To improve performance, a developer wants to capture trace information between the microservices and visualize the microservices architecture.  
Which solution will meet these requirements?

A. Build the container from the amazon/aws-xray-daemon base image. Use the AWS X-Ray SDK to instrument the application.

#### Question 73

A company is planning to use AWS CodeDeploy to deploy an application to Amazon Elastic Container Service (Amazon ECS). During the deployment of a new version of the application, the company initially must expose only 10% of live traffic to the new version of the deployed application. Then, after 15 minutes elapse, the company must route all the remaining live traffic to the new version of the deployed application.  
Which CodeDeploy predefined configuration will meet these requirements?

A. CodeDeployDefault.ECSCanary10Percent15Minutes

#### Question 74

A developer notices timeouts from the AWS CLI when the developer runs list commands.  
What should the developer do to avoid these timeouts?

A. Use the --page-size parameter to request a smaller number of items.

#### Question 75 (marked)

A company has moved a legacy on-premises application to AWS by performing a lift and shift. The application exposes a REST API that can be used to retrieve billing information. The application is running on a single Amazon EC2 instance. The application code cannot support concurrent invocations. Many clients access the API, and the company adds new clients all the time.  
A developer is concerned that the application might become overwhelmed by too many requests. The developer needs to limit the number of requests to the API for all current and future clients. The developer must not change the API, the application, or the client code.  
What should the developer do to meet these requirements?

A. Place the API behind an Amazon API Gateway API. Set the server-side throttling limits.

#### Question 76 (marked)

An ecommerce company wants to redirect users to a country-specific website when they enter the example.com website. For example, the company wants to redirect United States users to example.com/us/ and wants to redirect French users to example.com/fr/. The web application is using Amazon CloudFront and an  
Application Load Balancer with an Amazon Elastic Container Service (Amazon ECS) cluster. The application's domain name resolution is configured in an  
Amazon Route 53 public hosted zone.  
Which solution will meet these requirements with the LEAST operational effort?

B. Create a CloudFront function to inspect the CloudFront-Viewer-Country header and return redirect responses to different URLs based on user location.

Note: Route53 cannot route by url


#### Question 77

A developer deploys an AWS Lambda function that runs each time a new Amazon S3 bucket is created. The Lambda function is supposed to attach an S3  
Lifecycle policy to each new S3 bucket. The developer discovers that newly created S3 buckets have no S3 Lifecycle policy attached.  
Which AWS service should the developer use to find a possible error in the Lambda function?

D. Amazon CloudWatch

#### Question 78

A developer has created a web API that uses Amazon Elastic Container Service (Amazon ECS) and an Application Load Balancer (ALB). An Amazon CloudFront distribution uses the API as an origin for web clients. The application has received millions of requests with a JSON Web Token (JWT) that is not valid in the authorization header. The developer has scaled out the application to handle the unauthenticated requests.  
What should the developer do to reduce the number of unauthenticated requests to the API?

C. Create a CloudFront function for the distribution Use the crypto module in the function to validate the JWT.

Note: Authorization header is not sufficient

#### Question 79

A developer is creating a mobile application that will not require users to log in.  
What is the MOST efficient method to grant users access to AWS resources?

D. Use Amazon Cognito to associate unauthenticated users with an IAM role that has limited access to resources.

#### Question 80

A developer has created on AWS Lambda function tool uses 15 MB of memory. When the developer runs the code natively on a laptop that has 4 cores, the function runs within 100 ms. When the developer deploys the code as a Lambda function with 128 MB of memory, the first run takes 3 seconds. Subsequent runs take more than 500 ms to finish.  
The developer needs to improve the performance of the Lambda function so that the function runs consistently in less than 100 ms, excluding the initial startup time.  
Which solution will meet this requirement?

C. Increase the memory of the Lambda function

#### Question 81

A company is planning to use AWS CodeDeploy to deploy an application to AWS Lambda. During the deployment of a new version of the application, the company initially must expose only 10% of live traffic to the new version of the deployed application. Then, every 10 minutes, the company must route another  
10% of live traffic to the new version of the deployed application until all live traffic is routed to the new version.  
Which CodeDeploy predefined configuration will meet these requirements?

C. CodeDeployDefault.LambdaLinear10PercentEvery10Minutes

#### Question 82 (marked)

A developer wants to use AWS Elastic Beanstalk to test a new version of on application in a test environment.  
Which deployment method offers the FASTEST deployment?

D. All at once

#### Question 83

A developer has built an application that inserts data into an Amazon DynamoDB table. The table is configured to use provisioned capacity. The application is deployed on a burstable nano Amazon EC2 Instance. The application logs show that the application has been failing because of a  
ProvisionedThroughputExceedException error.  
Which actions should the developer take to resolve this issue? (Choose two.)

C. Reduce the frequency of requests to DynamoDB by implement ng exponential backoff.
E. Change the capacity mode of the DynamoDB table from provisioned to on-demand.

#### Question 84 (marked)

A developer is deploying on application on Amazon EC2 instances that run in Account A. In certain cases, this application needs to read data from a private  
Amazon S3 bucket in Account B. The developer must provide the application access to the S3 bucket without exposing the S3 bucket to anyone else.  
Which combination of actions should the developer take to meet these requirements? (Choose two.)

B. Update the instance profile IAM role in Account A with S3 read permissions.
D. Configure the bucket policy in Account B to grant permissions to the instance profile role.

#### Question 85

A developer at a company recently created a serverless application to process and show data from business reports. The application's user interface (UI) allows users to select and start processing the flies. The UI displays a message when the result is available to view. The application uses AWS Step Functions with AWS  
Lambda functions to process the files. The developer used Amazon API Gateway and Lambda functions to create an API to support the UI.  
The company's UI team reports that the request to process a file s often returning timeout errors because of the size or complexity of the files. The UI team wants the API to provide an immediate response so that the UI can display a message while the files are being processed. The backend process that is invoked by the  
API needs to send an email message when the report processing is complete.  
What should the developer do to configure the API to meet these requirements?

A. Change the API Gateway route to add an X-Amz-Invocation-Type header with a static value of 'Event' in the integration request. Deploy the API Gateway stage to apply the changes.

#### Question 86

An ecommerce application is running behind an Application Load Balancer. A developer observes some unexpected load on the application during non-peak hours. The developer wants to analyze patterns for the client IP addresses that use the application.  
Which HTTP header should the developer use for this analysis?

C. The X-Forwarded-For header

#### Question 87

A developer needs to create an application that supports Security Assertion Markup Language (SAML) and authentication with social media providers. It must also allow access to AWS services, such as Amazon DynamoDB.  
Which AWS service or feature will meet these requirements with the LEAST amount of additional coding?

B. Amazon Cognito identity pools

#### Question 88

A developer is designing a serverless application for an ecommerce website. An Amazon API Gateway API exposes AWS Lambda functions for billing, payment, and user operations. The website features shopping carts for the users. The shopping carts must be stored for extended periods of time and will be retrieved frequently by the front-end application.  
The load on the application will vary significantly based on the time of day and the promotional sales that are offered on the website. The application must be able to scale automatically to meet these changing demands.  
Which solution will meet these requirements?

D. Store the data objects in Amazon DynamoDB tables. Cache the data objects by using DynamoDB Accelerator (DAX).

#### Question 89

A company is migrating its on-premises database to Amazon RDS for MySQL. The company has read-heavy workloads, and wants to make sure it re-factors its code to achieve optimum read performance for its queries.  
How can this objective be met?

C. Add a connection string to use an RDS read replica for read queries.

#### Question 90

An application running on Amazon EC2 opens connections to an Amazon RDS SQL Server database. The developer does not want to store the user name and password for the database in the code. The developer would also like to automatically rotate the credentials.  
What is the MOST secure way to store and access the database credentials?

B. Use AWS Secrets Manager to store the credentials. Retrieve the credentials from Secrets Manager as needed.