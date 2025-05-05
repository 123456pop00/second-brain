# Compute & Storage

## Overview

Amazon EC2 provides scalable computing capacity in the AWS cloud. EBS, Instance Store, and EFS are the main storage options for EC2 instances. This document covers EBS Volumes, EC2 Instance Store, Elastic File System (EFS), and Amazon FSx.

## EBS Volume

Amazon Elastic Block Storage (EBS) allows you to create storage volumes and attach them to EC2 instances. Once attached, you can create a file system on top of these volumes, run a database, or use them in any other way you would use a block device. Amazon EBS volumes are placed in a specific Availability Zone, where they are automatically replicated to protect you from failure of a single component (i.e. they exist across multiple physical drives). Think of EBS as a disk in the cloud that you attach to your EC2 instance.

- An EC2 machine loses its root volume (main drive) when it is manually terminated.
- Unexpected terminations might happen from time to time (AWS would email you)
- Sometimes, you need a way to store your instance data somewhere.
- An EBS (Elastic Block Store) Volume is a network drive you can attach to your instances while they run
- It allows your instances to persist data

### EBS Volume Details

- It’s a network drive (Not a physical drive)
    - It uses the network to communicate the instance, which means there might be a bit of latency
    - It can be detached from an EC2 instance and attached to another one quickly
- It’s locked to an Availability Zone (AZ)
    - An EBS Volume in us-east-1a cannot be attached to us-east-1b
    - To move a volume across, you first need to snapshot it
- Have a provisioned capacity (size in GBs and IOPs)
    - You get billed for all the provisioned capacity
    - You can increase the capacity of the drive over time
- Have a `delete-on-termination` attribute that controls behavior on EC2 termination

#### Volumes Types

EBS Volumes come in 4 types:
- gp2/gp3 (SSD): general purpose SSD for good balance (e.g.: most workloads, VM workloads, System boot volumes, low-latency interactive apps, development and test environments)
- io1/io2 (SSD): high performance SSD for low-latency or high-throughput workloads (e.g.: database workloads, critical business applications that require sustained IOPS, or more than 16000 IOPS per volume (gp2 limit))
- st1 (HDD): low cost HDD volume for frequently accessed, throughput-intensive workloads (e.g.: Big Data, Data Warehouse, Log Processing workloads, Apache Kafka)
- sc1 (HDD): lowest cost HDD volume designed for less frequently accessed workloads

**Notes:**
- Only GP2 and IO1 can be used as boot volumes
- GP2 limit is 16000
- EBS Volumes are characterized in Size | Throughput | IOPS

#### EBS Volume Resizing

- Feb 2017: You can resize your EBS Volumes
- After resizing an EBS volume, you need to repartition your drive

#### EBS Snapshots

- EBS Volumes can be backed up using “snapshots”
- Snapshots only take the actual space of the blocks on the volume
- If you take a snapshot of a 100GB drive that only has 5 GB of data, then your EBS snapshot will only be 5 GB
- Snapshots are used for:
    - Backups: ensuring you can save your data in case of catastrophe
    - Volume migration
        - Resizing a volume down
        - Changing the volume type
        - Encrypt a volume
- Recycle BIN for EBS Snapshots = allows to setup rules to retain deleted snapshot (in case of accidental deletion), you can specify retention (1 day to 1 year)
- Fast Snapshot Restore (FSR) = force full initialization of snapshot to `no latency` on first use (is costly)

#### EBS Encryption

- When you create an encrypted EBS volume, you get the following:
    - Data at rest is encrypted inside the volume
    - All the data in flight moving between the instance and the volume is encrypted
    - All snapshots are encrypted
    - All volumes created from the snapshots are encrypted
- Encryption and decryption are handled transparently (you have nothing to do)
- Encryption has a minimal impact on latency
- EBS Encryption leverages keys from KMS (AES-256)
- Copying an unencrypted snapshot allows encryption

## EC2 Instance Store

Represent a high-performance hardware disk which has the following properties:
- Better I/0 performance
- Lose storage if stopped (ephemeral)
- Good for buffer / cache / scratch data / temporary content
- Risk of data if hardware fails
- Backup & Replication are your reasonability

## Elastic File System (EFS)

- Is a managed NFS (network file system) which **can be mounted on 100s of EC2**.
- Works with only **Linux** EC2 instances in **multi-AZ**, scale automatically and pay for use
- Highly available, scalable, expensive, pay per use, no capacity planning
- Use cases: content management, web serving, data sharing, WordPress
- Uses NFSv4.1 protocol and you control access through a security group

### EFS Infrequent Access (EFS-IA)

- Storage class that is cost-optimized for files not accessed every days
- EFS will automatically move your files to EFS-IA based on the last time they were accessed
- Enable EFS-IA with a Lifecycle Policy 

## Amazon FSx
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

## EBS vs. Instance Store

- Some instance do not come with Root EBS volumes
- Instead, they come with “instance Store”
- Instance store is physically attached to the machine
- Pros:
    - Better I/O performance
- Cons:
    - On termination, the instance store is lost
    - You can’t resize the instance store
    - Backups must be operated by the user
- Overall, EBS-backed instances should fit most applications workloads

## Summary

- EBS can be attached to only one instance at a time
- EBS are locked at the AZ level
- Migrating an EBS volume across AZ means first backing it up (snapshot), then recreating it in the other AZ
- EBS backups use IO and you shouldn’t run them while your application is handling a lot of traffic
- Root EBS Volumes of instances get terminated by default if the EC2 instance gets terminated. (You can disable that)
- In some cases, it's better to externalize your RDS database so that it won't get deleted when you delete your elastic beanstalk environment
- Elastic Beanstalk relies on CloudFormation

### Use Cases Summary

- Big Data / Data Warehouses / Log Processing : ST1 (HDD)
- Lowest storage cost : SC1 (HDD)
- NoSQL such as MongoDB, Cassandra or MSQL : IO1 (SSD)
- Low latency applications : GP2 (SSD)