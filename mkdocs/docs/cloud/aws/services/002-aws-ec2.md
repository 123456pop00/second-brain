# Elastic Compute Cloud (EC2)

## Overview

Amazon EC2 provides scalable computing capacity in the AWS cloud. It allows you to launch virtual servers (instances) with customizable OS, CPU, RAM, storage, and networking options.

## Instance Types

1. General Purpose: great for a diversity of workloads such as web servers (has balance between compute, memory, networking)
2. Compute Optimized: great for compute-intensive tasks that require high performance processors (batch processing workloads, media transcoding, high performance web servers, dedicated gaming servers)
3. Memory Optimized: fast performance for workloads that process large data sets in memory (high performance relational/non-relation databases, distributed web scale cache stores, real-time processing of big unstructured data)
4. Storage Optimized: great for storage intensive tasks that require high, sequential read and write access to large data sets on local storage (online transactions processing systems, relational & nosql databases, data warehousing)

## Security Groups

- Are Stateful
- They control how traffic is allowed in/out of the EC2 instances, acting as a sort of "firewall"
- The security groups only contain **ALLOW** rules
  - all inbound traffic is blocked by default
  - all outbound traffic is authorized by default
- Security group rules can reference by IP or by security group.
- Can be attached to multiple instances
- Locked down to a region/VPC combination
- Lives "outside" of the EC2, if traffic is blocked => EC2 instance won't see it

### Classic Ports
- 22 = SSH (Secure Shell)
- 21 = FTP (File Transfer Protocol)
- 22 = SFTP (Secure File Transfer Protocol)
- 80 = HTTP (access unsecured websites)
- 443 = HTTPS (access secured websites)
- 3389 = RDP (Remote Desktop Protocol) - log into a windows instance

## Instance Purchasing Options

- On-Demand Instances - short workload, predictable pricing, pay by second
- Reserved (1 & 3 years): reserve specific instance attributes (type, region, tenancy, os)
  - Reserved Instances - long workloads
  - Convertible Reserved Instance - long workloads with flexible instance
- Saving Plans (1 & 3 years) - commitment to an amount of usage, long workload
- Spot Instances - short workloads, cheap, can lose instances (less reliable). You can "lose" at any point of time if your max price is less that the current spot price.
- Dedicated hosts - book an entire physical server, control instance placement
- Capacity Reservations - reserve capacity in a specific AZ for any duration

## EC2 Instance Storage

### Elastic Block Store Volume (EBS)

- Is a **network drive** you can attach to your instances while they run (it uses the network to communicate => some minor latency).
- It allows your instancecs to persist data, even after their termination
- They can only be mounted to one instance at a time (at the CCP level)
- They are bound to a specific availability zone
- They can detached and attached to another EC2 quickly
- Provisioned Capacity (size in GBs and IOPS)
- Have a `delete-on-termination` attribute that controls behaviour on EC2 termination

#### EBS Snapshots

- Allows you to make a backup of your EBS volume at a point in time.
- Not necessary to detach the volume to do snapshot but it is recommended
- Can copy snapshots across AZ or Region

##### Volume Types

- gp2/gp3 (SSD): general purpose SSD for good balance (e.g.: VM workloads)
- io1/io2 (SSD): high performance SSD for low-latency or high-throughput workloads (e.g.: database workloads)
- st1 (HDD): low cost HDD volume for frequently accesed, throughput-internsive workloads (e.g.: Big Data, Data Warehouse, Log Processing workloads)
- sc1 (HDD): lowest cost HDD volume designed for less frequently accessed workloads

**NOTES**: Only gp2/gp3 and io1/io2 can be used as boot volumes

##### EBS Snapshots Features

- EBS Snapshot Archive = allows to move a snapshot to an `archive tier` (75% cheaper but takes between 24/72 hours to restore)
- Recycle BIN for EBS Snapshots = allows to setup rules to retain deleted snapshot (in case of accidental deletion), you can specify retention (1 day to 1 year)
- Fast Snapshot Restore (FSR) = force full initialization of snaphost to `no latency` on first use (is costly)

##### EBS Multi-Attach - only for io1/io2 family

- Allows to attach the same EBS volume to multiple EC2 in the same AZ (each instance gaining full read/write permissions)
- Used for higher application availability in clustered linux applications or for application that must manager concurent write operations
- Limitation of up to 16 EC2 instance at a time and must use a file system that is cluster-aware (not xfs, EXT4, etc)

### Amazon Machine Image (AMI)

- represent a customization of an EC2 instance (with software pre-packaged => faster boot time)
- they are built for a **specific region** (can be copied across regions)
- You can launch them from
  - A Public AMI (provided by AWS)
  - Your own AMI (make and maintain yourself)
  - AWS Marketplace AMI (somebody else made and sells)

#### Construction of an AMI

- Start EC2 => customize it => stop instance => build an AMI (will create EBS snapshots) => launch instance using the AMI
- Use EC2 Image Builder (free of service / you only pay for underlying resources) => automate creation/maintain/validate/test of AMI and can be run on a schedule

### EC2 Instance Store

Represent a high-performance hardware disk which has the following properties:
- Better I/0 performance
- Lose storage if stopped (ephemeral)
- Good for buffer / cache / scratch data / temporary content
- Risk of data if hardware fails
- Backup & Replication are your responability

### Elastic File System (EFS)

- Is a managed NFS (network file system) which **can be mounted on 100s of EC2**.
- Works with only **Linux** EC2 instances in **multi-AZ**, scale automatically and pay for use
- Highly available, scalable, expensive, pay per use, no capacity planning
- Use cases: content management, web serving, data sharing, wordpress
- Uses NFSv4.1 protocol and you control access through a security group

#### Types 

**Performance Mode** (set at EFS creation time)
- General Purpose (default)
- Max I/O
**Througput Mode**
- Bursting = 1 TB = 50MIB/S + burst of up to 100 MIB/s
- Provisioned = set your throughput regardless of storage size (1GIB/s for 1 TB storage)
- Elastic = automatically scales (good for unpredicable workloads)
**Availability and durability**
- Regional (Standard): multi-az
- One-Zone: one az, great for dev, backup
  
#### EFS Infrequent Access (EFS-IA)

- Storage class that is cost-optimized for files not accessed every days
- EFS will automatically move your files to EFS-IA based on the last time they were accessed
- Enable EFS-IA with a Lifecycle Policy 

### Amazon FSx
A fully-managed, high-performance file system on AWS.

For Windows File Serve
- **Windows native** shared file system
- Built on Windows File Server
- Supports SMB protocol & Windows NTFS
- Integrated with Microsoft Active Directoy
- Can be accessed from AWS or your on-premise infrastructure
For Lustre (derived from 'Linux' and 'cluster')
- used for Linux File System
- used for High Performance Computing (HPC)
- Scales up to 100s GB/s, million IOPS
