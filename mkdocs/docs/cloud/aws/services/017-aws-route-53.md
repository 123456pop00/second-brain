# Route 53

- A highly available, scalable, fully managed and Authoritative DNS 
    - Authoritative = the customer (you) can update the DNS records 
- Route 53 is also a Domain Registrar 
- Ability to check the health of your resources 
- The only AWS service which provides 100% availability SLA

## DNS

- Domain Name System which translates the human friendly hostnames into the machine IP addresses
- www.google.com => 172.217.18.36
- DNS uses hierarchical naming structure
    - .com
    - example.com
    - www.example.com
    - api.example.com

### DNS Terminologies

- Domain Registrar: Amazon Route 53, GoDaddy, …
- DNS Records: A, AAAA, CNAME, NS, …
- Zone File: contains DNS records
- Name Server: resolves DNS queries (Authoritative or Non-Authoritative)
- Top Level Domain (TLD): .com, .us, .in, .gov, .org, …
- Second Level Domain (SLD): amazon.com, google.com, …

## Records

- How you want to route traffic for a domain
- Each record contains:
    - Domain/subdomain Name – e.g., example.com
    - Record Type – e.g., A or AAAA
    - Value – e.g., 12.34.56.78
    - Routing Policy – how Route 53 responds to queries
    - TTL – amount of time the record cached at DNS Resolvers
        - High TTL - e.g. 24hr => possibly outdated records
        - Low TTL - e.g. 60 sec => more traffic on route 53 (expensive), less chance for outdated records, easy to change records
        - Mandatory for each DNS records except Alias
- Route 53 supports the following DNS record types:
    - (must know) A / AAAA / CNAME / NS
    - (advanced) CAA / DS / MX / NAPTR / PTR / SOA / TXT / SPF / SRV

### Record Types 

- A – maps a hostname to IPv4
- AAAA – maps a hostname to IPv6
- CNAME – maps a hostname to another hostname
    - The target is a domain name which must have an A or AAAA record
    - ONLY FOR NON ROOT DOMAIN (aka. something.mydomain.com)
    - Can’t create a CNAME record for the top node of a DNS namespace (Zone Apex)
        - Example: you can’t create for example.com, but you can create for www.example.com
- NS – Name Servers for the Hosted Zone
    - Control how traffic is routed for a domain
- Alias - (Route 53 AWS specific)
    - Points a hostname to an AWS Resource (app.mydomain.com => blabla.amazonaws.com)
    - An extension to DNS functionality
    - Works for ROOT DOMAIN and NON ROOT DOMAIN (aka mydomain.com)
    - Alias Record is always of type A/AAAA for AWS resources (IPv4 / IPv6)
    - You can’t set the TTL
    - Free of charge
    - Native health check
    - Target can be: ELB, Cloudfront Distributions, Api Gateway, Elastic Beanstalk Environments, S3 Websites, VPC Interface Endpoints, Global Accelerator accelarator, Route 53 record in same hosted zone
        - You cannot set an alias recrod for an ec2 DNS name

## Hosted Zones

A container for records that define how to route traffic to a domain and its subdomains

- Public Hosted Zones – contains records that specify how to route traffic on the Internet (public domain names) application1.mypublicdomain.com
- Private Hosted Zones – contain records that specify how you route traffic within one or more VPCs (private domain names) application1.company.internal
- You pay $0.50 per month per hosted zone

## Routing Policies

Define how Route 53 responds to DNS queries
Route 53 Supports the following Routing Policies:
- Simple (route to single resources, if multiple target one is chosen random by client, can't be associated with health checks)
- Weighted (assign weight to redirect % traffic per target, can be associated with health checks)
- Failover 
- Latency based (Redirect to the resource that has the least latency close to us, Latency is based on traffic between users and AWS Regions)
- Geolocation (• This routing is based on user location)
- Multi-Value Answer 
- Geoproximity (using Route 53 Traffic Flow feature)

## Exam Tips

- The failure threshold is specified by the AWS customer. A failure is when the endpoint does not respond to a request.
- What will ACM do prior to expiration
    - If the certificate is being used by an AWS service and ACM-provided CNAME records are accessible via the public DNS, ACM will consider the domain name validated and auto renew the certificate.
    - If the domain is not validated, it will send Health events or EventBridge events to notify the domain owner prior to expiration.