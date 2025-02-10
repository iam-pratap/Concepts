# Elastic Compute Cloud
EC2 is a cloud computing service offered by Amazon Web Services(AWS) that allows you to rent virtual computers in the cloud.
AWS Management console means you have a access of complete datacenter.

## Why EC2?
- Scalability
- Cost-effectiveness
- Reliability and Availability
- Integration with other AWS Services

## Types of EC2
1. General puppose
2. Compute optimized
3. Memory Optimized
4. Storage Optimized
5. Accelarated Compute

### Regions and Availability Zones
Regions are geographic locations where AWS data centers are located. Availability Zones (AZs) are isolated locations within a region. By distributing resources across multiple AZs, you can improve high availability, fault tolerance, and data redundancy.

#### Why we use Regions and AZs
- **High Availability:** By distributing your resources across multiple AZs, you can reduce the risk of a single point of failure.
- **Disaster Recovery:** Regions and AZs can be used to implement disaster recovery plans, allowing you to quickly recover from outages or disruptions.
- **Compliance:** Some industries or organizations may require data to be stored in specific regions or AZs for compliance reasons.
- **Performance Optimization:** Placing your resources in a region closer to your users can improve performance and reduce latency.

Example:

Region: US East (N. Virginia) 

Availability Zones: us-east-1a, us-east-1b, us-east-1c

### Difference Between Volume, Snapshot, and AMI in AWS 

| Feature        | Volume (EBS Volume) | Snapshot | AMI (Amazon Machine Image) |
|--------------|----------------|------------|----------------|
| **Definition** | A virtual hard disk attached to EC2 instances. | A backup of an EBS volume at a point in time. | A pre-configured image containing OS, applications, and configurations. |
| **Purpose** | Provides persistent block storage for EC2 instances. | Used for backup, recovery, or creating new volumes. | Used to launch new EC2 instances with the same configuration. |
| **Storage Type** | EBS (Elastic Block Store). | S3 (stored in Amazon S3 internally). | S3 (internally stored). |
| **Data Content** | Contains active data used by the EC2 instance. | A copy (backup) of an EBS volume. | Contains a bootable OS, applications, and volume snapshots. |
| **Use Case** | - Store OS, applications, databases, and logs. <br> - Can be attached/detached to instances. | - Create a backup before making changes. <br> - Restore a volume if data is lost. | - Deploy multiple instances from a single configuration. |
| **Persistence** | Persists even if EC2 instance is stopped/terminated (if not root volume). | Persistent (remains available even if the original volume is deleted). | Persistent (can be used anytime to launch new instances). |
| **Modifications** | Can be resized, encrypted, or changed to different types (GP2, GP3, IO1, etc.). | Can be copied across regions. | Can be customized with software and settings before creation. |
| **Example Use** | Running a web server, database, or file storage. | Creating a backup before making major updates. | Pre-configured machine images for easy instance deployment. |

#### Key Relationships
- A Snapshot is created from a Volume (backup).
- An AMI includes one or more Snapshots (along with other configurations).
- New volumes can be created from a Snapshot or an AMI.

#### Example Scenario
- **Volume:** You run an EC2 instance with an EBS volume (/dev/sda1 for OS and /dev/sdb for data).
- **Snapshot:** Before upgrading software, you create a snapshot of the volume as a backup.
- **AMI:** You configure an EC2 instance with necessary software and settings, then create an AMI from it to launch multiple similar instances later.


