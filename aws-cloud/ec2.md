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

