# Elastic Load Balancer

AWS Elastic Load Balancer (ELB) is a fully managed load-balancing service that automatically distributes incoming application traffic across multiple targets, such as EC2 instances, containers, IP addresses,
and Lambda functions, in one or more Availability Zones (AZs). It helps improve application availability, fault tolerance, and scalability.

## Types of AWS ELB
AWS offers three main types of load balancers:

### 1. Application Load Balancer (ALB)
- Works at Layer 7 (Application Layer) of the OSI model.
- Best for HTTP/HTTPS traffic.
- Supports path-based and host-based routing.
- Supports WebSockets.
- Ideal for microservices and containerized applications (integrates with Amazon ECS and Kubernetes).
- **Use case:** Web applications, API Gateway, microservices.

### 2. Network Load Balancer (NLB)
- Works at Layer 4 (Transport Layer).
- Handles TCP, UDP, and TLS traffic.
- Capable of handling millions of requests per second.
- Supports static IPs and Elastic IP addresses.
- Ultra-low latency, making it ideal for real-time applications.
- **Use case:** High-performance applications, real-time gaming, VoIP.

### 3. Gateway Load Balancer (GWLB)
- Works at Layer 3 (Network Layer).
- Used mainly for security and network appliances (e.g., firewalls, intrusion detection/prevention systems).
- Provides transparent network traffic inspection.
- **Use case:** Security appliances, deep packet inspection.

### 4. Classic Load Balancer (CLB) [Deprecated for new apps]
- Works at both Layer 4 (TCP) & Layer 7 (HTTP/HTTPS).
- Older generation ELB, replaced by ALB and NLB.
- Still used for legacy applications.
- **Use case:** Legacy applications that haven’t migrated to ALB/NLB.

### Target Group
A Target Group in AWS ELB defines the backend destinations where incoming traffic should be routed. It groups together EC2 instances, IP addresses, Lambda functions, or containers that will receive traffic from the Load Balancer.

#### Key Features of Target Groups:

- Supports different target types:
- Instance → Routes traffic to EC2 instances.
- IP Address → Routes traffic to specific IP addresses (useful for on-prem or hybrid setups).
- Lambda → Routes traffic to AWS Lambda functions.
- Health checks ensure that only healthy targets receive traffic.
- Each Load Balancer can route traffic to multiple Target Groups based on rules (for ALB).

#### Example Use Case:
If you have a microservices architecture, you might have:

Target Group 1 → for /api/orders (routes to Order Service EC2 instances).

Target Group 2 → for /api/users (routes to User Service EC2 instances).

### Listeners
A Listener is a process that checks for incoming client requests on a specific port and protocol and routes the requests to the appropriate Target Group.

#### Key Features of Listeners:

- Each listener is configured with a protocol and port (e.g., HTTP:80, HTTPS:443, TCP:22).
- Can have multiple rules to direct traffic based on conditions.
- Supports SSL/TLS termination (for HTTPS connections).
  
#### Example Use Case:

Listener on Port 80 (HTTP) → Redirects to HTTPS.
Listener on Port 443 (HTTPS) → Routes traffic to different Target Groups based on path rules.

### 🛠 How They Work Together
- Client sends a request to the Load Balancer.
- Listener checks the request and determines routing based on rules.
- Listener forwards the request to the correct Target Group.
- Target Group sends the request to a healthy EC2 instance or service.

## Steps to Create an AWS ELB using the AWS Console

#### 1️. Navigate to the AWS Load Balancer Service
- Log in to your AWS Management Console.
- Go to the EC2 Dashboard.
- On the left panel, click Load Balancers (under "Load Balancing").
- Click Create Load Balancer.
  
#### 2. Choose Load Balancer Type
- Select the type of ELB:
- Application Load Balancer (ALB) → Best for HTTP/HTTPS traffic.
- Network Load Balancer (NLB) → Best for high-performance TCP/UDP traffic.
- Gateway Load Balancer (GWLB) → Best for security appliances.
- Click Create for the chosen load balancer.

#### 3. Configure the Load Balancer
🔹 For ALB & NLB:
- Set Name: Enter a name for your load balancer.
- Choose Scheme:
- Internet-facing → Publicly accessible from the internet.
- Internal → Only accessible within the VPC.
- Choose IP Address Type:
- IPv4 or Dual-stack (IPv4 & IPv6).
- Select VPC & Availability Zones: Choose the VPC and subnets where your load balancer should run.

#### 4️. Configure Security & Listeners
🔹 For ALB:
- Listener Configuration:
- Default is HTTP (80). You can add HTTPS (443).
- Upload an SSL certificate (if using HTTPS).
- Security Group:
- Select or create a Security Group that allows traffic (e.g., allow HTTP/HTTPS).
🔹 For NLB:
- Listener Configuration:
- Supports TCP, UDP, or TLS.
- You can assign a static Elastic IP (optional).
- Security Groups: Not required (NLB doesn’t use security groups).
  
#### 5️. Configure Target Group
- Target Group Name: Enter a name (e.g., my-target-group).
- Target Type:
- Instance → Choose EC2 instances.
- IP Address → Manually enter IPs.
- Lambda → Forward traffic to AWS Lambda.
- Health Check Settings:
- Protocol: HTTP or TCP.
- Path: / (for ALB).
- Healthy threshold: Default is 5.
  
#### 6️. Register Targets (EC2 Instances)
- Click Add Targets.
- Select your EC2 instances.
- Click Include as pending below.
- Click Create Load Balancer.
  
#### 7️. Test the Load Balancer
- Copy the DNS Name of your load balancer.
- Open a browser and paste the DNS (e.g., http://my-load-balancer-1234567890.us-east-1.elb.amazonaws.com).
- If set up correctly, it should route traffic to one of your EC2 instances.

