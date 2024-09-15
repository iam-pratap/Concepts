# AWS Security using Security Groups and NACL 

AWS (Amazon Web Services) provides multiple layers of security to protect resources and data within its cloud infrastructure. Two important components for network security in AWS are Security Groups and Network Access Control Lists (NACLs). Let's explore how each of them works:

## Security Groups:
- Security Groups act as virtual firewalls at the instance level.
- It can be configured to allow only specific type of traffic.
- Security Groups can be configured using IP addresses, CIDR blocks, security group IDs, or DNS names to specify the source or destination of the traffic.
- They are stateful, meaning that if an inbound rule allows traffic, the corresponding outbound traffic is automatically allowed, and vice versa.

## Network Access Control Lists (NACLs):
- NACLs are an additional layer of security that operates at the subnet level.
- Unlike Security Groups, NACLs are associated with subnets, and each subnet can have only one NACL. However, multiple subnets can share the same NACL.
- NACLs consist of a numbered list of rules (numbered in ascending order) that are evaluated in order from lowest to highest.
- Each rule in the NACL includes a rule number, protocol, rule action (allow or deny), source or destination IP address range, port range, and ICMP (Internet Control Message Protocol) type.
- NACL rules can be configured to allow or deny specific types of traffic based on the defined criteria.
- They are stateless, which means that if an inbound rule allows traffic, the corresponding outbound traffic must be explicitly allowed using a separate outbound rule.
  

**Note** : Inbound rules determine the traffic that is allowed to reach the EC2 instance, whereas outbound rules control the traffic leaving the instance.

## Diagram


![Screenshot 2023-06-29 at 12 14 32 AM](https://github.com/iam-veeramalla/aws-devops-zero-to-hero/assets/43399466/30bbc9e8-6502-438b-8adf-ece8b81edce9)
