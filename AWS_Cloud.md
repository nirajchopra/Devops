```md
# AWS (Amazon Web Services)

## CHAPTER - 01
### CLOUD COMPUTING FUNDAMENTALS
(Understanding the foundation of cloud technology and why AWS leads the market)
1. Cloud Concepts
2. Service Models
3. Business Benefits

**Question:** What is AWS & Cloud Computing?

**Amazon Web Services (AWS):** A comprehensive cloud computing platform that provides on-demand access to a wide range of IT resources over the internet.  
1. Compute Servers  
2. Managed Databases  
3. DevOps Tools  
4. Storage Systems  
5. Networking  
6. Managed Services  

**Cloud Computing Model:**  
Instead of buying physical hardware, you rent IT resources on-demand, paying only for what you consume, with instant global accessibility.  
1. Pay-As-You-Go (No upfront costs)  
2. Global Access (Anytime, Anywhere)  
3. Instant Scaling (Elastic resources)  

**Cloud Service Models:**

1. **IaaS – Infrastructure**  
   Rent virtual machines, storage, networking. You manage the OS and applications.  
   *Examples:* EC2, VPC  

2. **PaaS – Platform**  
   Focus on application code while AWS manages the underlying infrastructure.  
   *Examples:* Elastic Beanstalk, Lambda  

3. **SaaS – Software**  
   Use complete applications managed by AWS, like the AWS Console itself.  
   *Examples:* AWS Console, Gmail  

## CHAPTER - 02
### AWS CORE SERVICES
(Exploring the fundamental building blocks of AWS cloud infrastructure)
1. Global Infrastructure
2. Service Categories
3. Regions & AZ

**AWS Global Infrastructure & Service Categories:**

**Global Infrastructure:**  
1. **Regions** – Physical locations worldwide (e.g., Mumbai, US-East, Frankfurt). Each region contains multiple isolated data centers called Availability Zones.  
2. **Availability Zones (AZs)** – Isolated data centers within a region, connected by low-latency networks. Each AZ has independent power, cooling, and security.  
3. **Edge Locations** – Global network of CDN points for caching content closer to users, reducing latency and improving performance.  

30+ Regions  90+ AZs  200+ Edge Locations  

**Major Service Categories:**

1. **Compute:** EC2, ECS, Lambda, Beanstalk  
2. **Storage:** S3, EBS, EFS  
3. **Database:** RDS, DynamoDB, Aurora, OpenSearch  
4. **Networking:** VPC, Route 53, ELB, CloudFront  
5. **DevOps:** CodeCommit, CodePipeline, CodeBuild, CodeDeploy  

## CHAPTER - 03
### SECURITY & IDENTITY
(Mastering AWS security foundations and access management best practices)
1. IAM
2. VPC
3. Access Control

**IAM: Identity & Access Management**  
What is IAM?  
IAM is the security backbone of AWS, enabling you to manage access to AWS services and resources securely.

1. Create Users – Individual accounts for each person  
2. Manage Permissions – Granular control over resource access  
3. Secure Resources – Protect AWS services from unauthorized access  

> **Critical Best Practice:** “Never use the root account for daily work!” Create individual IAM users and follow the principle of least privilege.

**IAM Core Components:**

1. **Users** – Individual identities representing a person or application that needs AWS access (Username, Credentials)  
2. **Roles** – Temporary permissions for services (EC2, ECS) to access other AWS resources (EC2Role, LambdaRole)  
3. **Groups** – Collections of users with shared permissions for easier management (DevTeam, OpsTeam)  
4. **Policies** – JSON documents defining precise permissions for actions on resources (AllowS3, DenyEC2)  

**IAM Workflow:** Users assume roles → Groups organize users → Roles grant temporary access → Policies define permissions → Resources are protected

**VPC: Virtual Private Cloud**  
What is VPC?  
VPC is a logically isolated section of the AWS cloud where you can launch resources in a virtual network that you define.

1. Private Network – Isolated from other AWS customers  
2. IP Control – Define IP address ranges and subnets  
3. Resource Isolation – Secure resources from unauthorized access  

> **Important Fact:** “Every EC2 instance runs inside a VPC.” Even if you don’t create one, AWS provides a default VPC in each region.

**VPC Key Components:**

1. **Subnets** – Segments of the VPC IP range. Public subnets have internet access, private subnets don’t.  
   *Public:* 10.0.1.0/24 *Private:* 10.0.2.0/24  
2. **Route Tables** – Rules determining where network traffic is directed within the VPC (Local Route, Internet Route)  
3. **Internet Gateway** – Allows VPC resources to communicate with the internet (IGW-12345)  
4. **Security Groups** – Virtual firewall controlling inbound/outbound traffic for instances (Port 22, 80, 443)  

## CHAPTER - 04
### COMPUTE & DEPLOYMENT
(Virtual servers, containers, and serverless computing for modern applications)
1. EC2
2. Containers
3. Serverless

**EC2: Elastic Compute Cloud Deep Dive**  
(Virtual servers in the cloud – the foundation of AWS compute)

What is EC2?  
EC2 provides resizable compute capacity in the cloud. Virtual servers you can launch in minutes with complete control over the operating system and applications.  
1. Full OS control  
2. Security groups  
3. Flexible instance types  
4. Key pair access  

**Key Concepts:**

1. **Instance Types** – t2.micro (free tier), m5.large (general purpose), c5.xlarge (compute optimized)  
2. **AMI (Amazon Machine Image)** – Pre-configured templates: Amazon Linux, Ubuntu, Windows Server  
3. **Key Pair** – SSH key for secure remote access to Linux instances  
4. **Security Groups** – Virtual firewall controlling inbound/outbound traffic  
5. **Elastic IP** – Static public IP address that persists across instance stops  

**EC2 Deployment Steps:**

1. **Launch Instance** – Choose region, select AMI, and begin instance creation process  
2. **Choose Instance Type** – Select based on CPU, memory, storage needs (e.g., t2.micro for free tier)  
3. **Configure Network** – Select VPC, subnets, assign public IP, configure security groups  
4. **Add Storage** – Configure EBS volumes (root and additional), set size and type  
5. **Configure Security Group** – Open ports: 22 (SSH), 80 (HTTP), 443 (HTTPS) as needed  
6. **Connect via SSH** – Use key pair: `ssh -i key.pem user@ip`  

> **Deployment Workflow:** SSH → Install Nginx/Docker → Configure firewall → Deploy application → Assign Elastic IP

**Containers & Serverless Computing:**

**Container Ecosystem:**

1. **ECR** – Elastic Container Registry: Private Docker image repository for storing container images (Image Storage, Version Control)  
2. **ECS** – Elastic Container Service: Managed container orchestration. Run Docker containers without managing servers (Fargate (Serverless), EC2 Launch)  
3. **EKS** – Elastic Kubernetes Service: Managed Kubernetes control plane for advanced container orchestration (Kubernetes, Advanced)  

> **Container Workflow:** Build Docker image → Push to ECR → Create ECS task → Deploy container → Service discovery

**Serverless: AWS Lambda**

What is Lambda?  
Run code without provisioning servers. Event-driven execution with automatic scaling.  

0 Server Management Auto Scaling 100 ms Billing  

**Use Cases:**  
- API backends (API Gateway + Lambda)  
- Data processing (S3 events, DynamoDB streams)  
- Automation (CloudWatch events, scheduled tasks)  

**EC2 vs Lambda Comparison:**  
1. **EC2 – Server-Based:** Continuous running, Full OS control, Hourly billing  
2. **Lambda – Serverless:** Event-driven, No server management, Per execution  

**Deployment Tools: Elastic Beanstalk & Auto Scaling**

**Elastic Beanstalk:**

1. Platform as a Service (PaaS) – Deploy applications easily without worrying about infrastructure. “AWS manages everything”—capacity provisioning, load balancing, auto scaling, monitoring.  
   Upload Code → AWS Deploys → Managed Infra  

Supported Platforms: Node.js, Python, Java, PHP, .NET, Docker  

Deployment Process:  
1. Create application  
2. Upload code package  
3. AWS provisions resources  
4. Application deployed  

**Load Balancer & Auto Scaling:**

1. **ELB** – Elastic Load Balancer distributes incoming traffic across multiple EC2 instances to ensure no single server is overwhelmed.  
   ALB (HTTP), NLB (TCP), GWLB  
   Health checks ensure traffic only routes to healthy instances  

2. **Auto Scaling** – Automatically increases/decreases the number of EC2 instances based on demand, optimizing cost and performance.  
   *Scaling Triggers:* CPU > 70%, Memory > 80%, Request Count  
   *Benefits:* Cost Optimization, High Availability, Fault Tolerance  

## CHAPTER - 05
### STORAGE & DATABASES
(Leveraging AWS storage solutions and managed database services)
1. S3
2. RDS
3. DynamoDB

**S3: Simple Storage Service**  
(Scalable object storage for the cloud)

What is S3?  
S3 provides object storage through a web service interface. Store and retrieve any amount of data from anywhere on the web.  
- 99.999999999% durability  
- Unlimited scalability  
- Pay-as-you-go  
- Static website hosting  

**Core Concepts:**  
1. **Buckets** – Containers for objects. Globally unique name. Regional resource.  
2. **Objects** – Files + metadata. Key (name), Value (data), Version ID.  
3. **Versioning** – Keep multiple versions. Protect against deletions.  

**Storage Classes & Features:**

**Storage Classes:**  
S3 Standard – Frequent access  
S3 IA – Infrequent access  
S3 Glacier – Archive  
S3 Deep Archive – Long-term backup  

**Lifecycle Policies:**  
Automate transitions between storage classes based on age.  
Day 0: Standard → 30 d: IA → 90 d: Glacier  

**Static Website Hosting:**  
Host static websites directly from S3 with HTTP endpoints.  
- Index & error documents  
- Custom domain support  
- CloudFront integration  

**AWS Database Services:**  
(Managed databases for every application need)

1. **RDS:** Relational Database Service – Managed relational databases with automated backups, patching, and scaling.  
   *Supported Engines:* MySQL, PostgreSQL, Oracle, SQL Server, MariaDB  
   *Features:* Multi-AZ deployment, Read replicas, Automated backups, Point-in-time recovery  
   **Use For:** Traditional applications, complex queries, ACID transactions  

2. **DynamoDB:** Managed NoSQL Database – Serverless, fast, and flexible database for applications requiring consistent performance.  
   *Key Features:* Serverless (no infrastructure), Single-digit millisecond latency, Automatic scaling, Global tables (multi-region)  
   *Data Model:* Hash Key, Range Key – Key-value and document data model with JSON support  
   **Use For:** Web/mobile apps, gaming, IoT, real-time analytics  

3. **OpenSearch:** Search & Analytics Engine – Fork of Elasticsearch for real-time search, analytics, and visualization.  
   *Capabilities:* Full-text search, Log analytics, Real-time dashboards, Security analytics  
   *Integrations:* Kinesis, CloudWatch, S3  
   **Use For:** Application search, log analytics, observability  

**Database Selection Guide:**  
RDS – Complex queries, joins, transactions  
DynamoDB – High throughput, simple queries, serverless  
OpenSearch – Full-text search, log analytics  

## CHAPTER - 05
### NETWORKING & CDN
(Optimizing content delivery and network infrastructure)
1. CloudFront
2. Route 53
3. SSL/TLS

**CloudFront CDN & Advanced Networking:**

**CloudFront CDN:**  
Content Delivery Network that caches content at edge locations worldwide for faster delivery to users.  
*How It Works:* Content cached at 200+ edge locations. Users get content from the nearest edge.  
*Origins:* S3, EC2, ELB, Custom  
*Benefits:* Faster content delivery, Reduced latency, Lower origin load, DDoS protection  

**Route 53:**  
Scalable DNS and domain registration. Routes end users to Internet applications.  
Domain Registration, DNS Routing, Health Checks  

**Advanced Networking Concepts:**

1. **SSL/TLS** – Encrypt data in transit. SSL/TLS certificates for HTTPS (Certificate Manager, Free SSL)  
2. **SSH** – Secure Shell for remote server access. Uses key pairs (Port 22, Key Pair)  
3. **Nginx Reverse Proxy** – Sits between clients and backend servers. Load balancing, SSL termination (Load Balance, SSL Terminate)  
4. **IPv4 / IPv6** – IP addressing protocols. IPv6 provides larger address space (IPv4: 32-bit, IPv6: 128-bit)  
5. **VPC Routing** – Route tables control traffic flow. Security groups act as virtual firewalls (Route Tables, Security Groups, NACL)  

## CHAPTER - 07
### DEVOPS & MONITORING
(Implementing CI/CD pipelines and infrastructure automation)
1. CodePipeline
2. CloudFormation
3. CloudWatch

**CI/CD Services & CloudFormation:**

**AWS Code Services:**

1. **CodeCommit** – Git repository service. Secure, scalable, managed Git repositories in the cloud (Git Compatible, Encryption)  
2. **CodePipeline** – CI/CD orchestration. Automate build, test, and deploy phases (Visual Workflow, Integration)  
3. **CodeBuild** – Build & test service. Compile source code, run tests, produce artifacts (Pay per build, Docker builds)  
4. **CodeDeploy** – Automated deployment. Deploy to EC2, Lambda, ECS with minimal downtime (Blue/Green, Rolling)  

> **CI/CD Workflow:** CodeCommit → CodePipeline triggers → CodeBuild → Test → CodeDeploy → Production

**CloudFormation (IaC):**

Infrastructure as Code: Define AWS resources in YAML/JSON templates. Create, update, and delete stacks predictably (YAML/JSON, Version Control)  

**Benefits:**  
1. Automation – No manual resource creation  
2. Reproducibility – Same infra across environments  
3. Version Control – Track infrastructure changes  

*Sample Template Structure:*

```yaml
Resources:
  MyEC2Instance:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: ami-123
      InstanceType: t2.micro
```

**Monitoring, Logging & Messaging:**

1. **CloudWatch:**  
   a) **Metrics** – Collect and track metrics from AWS resources and applications (CPU, Memory, Disk, Network)  
   b) **Logs** – Centralized log management. Aggregate, monitor, and analyze log files (Log Groups, Log Streams)  
   c) **Alarms** – Send notifications or take actions when metrics breach thresholds (SNS, Auto Scaling, Lambda)  

   **CloudTrail** – “API activity tracking.” Log and monitor AWS API calls for auditing and compliance (Who made the call, What action was taken, When it occurred)  

2. **Messaging & Analytics:**  
   a) **SNS** – Pub/Sub messaging. Send notifications to multiple subscribers (Email, SMS, Lambda)  
   b) **SQS** – Queue-based messaging. Decouple and scale microservices (Standard, FIFO)  
   c) **SES** – Email service. Send marketing, transactional, and notification emails (SMTP, API)  

   **Analytics & Data Pipeline:**  
   Athena – SQL queries on S3  
   Glue – ETL service  
   Redshift – Data warehouse  
   Kinesis – Stream processing  

## CHAPTER - 08
### DEVOPS WORKFLOW
(Real-world deployment patterns and exam preparation strategies)
1. Real Workflow
2. Exam Tips
3. Best Practices

**Real AWS DevOps Deployment Workflow:**  
(Complete CI/CD pipeline from code to production)

**Production-Ready CI/CD Pipeline:**  
1. **Developer Pushes Code** – Code changes pushed to GitHub or CodeCommit repository trigger the pipeline automatically  
2. **CodePipeline Orchestrates** – Pipeline triggers build process, runs tests, and coordinates deployment stages  
3. **CodeBuild Creates Docker Image** – Builds application, runs tests, creates optimized Docker image, and pushes to ECR  
4. **ECS Deploys Container** – Pulls image from ECR, deploys container to Fargate or EC2 cluster with auto scaling  
5. **Load Balancer Exposes App** – Application Load Balancer routes traffic to containers. Health checks ensure availability  
6. **CloudWatch Monitors & Logs** – Collects metrics, aggregates logs, triggers alarms for anomalies. Enables debugging and optimization  

> **Flask + MongoDB Mini Project:** Deploy a Python Flask application with MongoDB backend using Docker and AWS services.  
> *Tech Stack:* Flask, MongoDB, Docker, EC2/ECS  
> *Deployment Steps:* Build Docker image locally → Push to ECR repository → Create ECS task definition  

**Key Integration Points:**  
Source Control → GitHub/CodeCommit  
Build & Test → CodeBuild  
Container Registry → ECR  
Container Runtime → ECS/Fargate  

**AWS Cheat Sheet & Exam Tips:**

| Service | Purpose |
|---|---|
| EC2 | Virtual server in the cloud |
| S3 | Object storage service |
| IAM | Identity & access management |
| VPC | Private network in AWS |
| ECR | Docker image repository |
| ECS | Run containers (managed) |
| Lambda | Serverless code execution |
| RDS | Managed relational database |
| CloudWatch | Monitoring & observability |
| CloudFormation | Infrastructure as Code |

**Exam Focus Points:**

1. **IAM Policies** – Understand JSON structure, least privilege principle, and the difference between users, groups, roles, and policies.  
2. **EC2 Security Groups** – Know how security groups work as virtual firewalls, stateful vs. stateless rules, and common port configurations.  
3. **VPC Networking** – Understand subnets, route tables, internet gateways, and how resources communicate within VPC.  
4. **CI/CD Flow** – Know the order: CodeCommit → CodeBuild → ECR → ECS/EC2 deployment with load balancer.  
5. **Docker + AWS Integration** – ECR stores images, ECS runs containers, Fargate is serverless option vs. EC2 launch type.  

### PRACTICES

#### IAM (User)
1. IAM  
2. Users  
3. Create user  
   - User name  
   - Enable console access  
   - Custom password  
   - Next  
4. Set Permissions  
   - Attach policies (Administrator Access)  
   - Next  
5. Review & Create  
   - Tag (key & value)  
   - Create user  
6. Retrieve password  
   - Download .csv file  
7. Create programmatic access  
   - Back on Users  
   - Select the user  
   - View user  
   - Security credentials  
   - Access keys → Create access key  
     a) Access key best practices & alternatives  
        - CLI  
        - I understand  
        - Next  
     b) Set description tag  
        - Description tag value  
        - Create  
     c) Retrieve access key  
        - Copy (remember it)  
        - Download .csv file  
        - Done  
8. Open Linux terminal (run commands)  
   ```
   aws --version
   aws configure
   # AWS Access Key ID:
   # AWS Secret Access Key:
   # Default region name:
   # Default output format:
   aws s3 ls
   ```

#### AWS S3 (Simple Storage Service) (Steps)
1. S3  
2. Buckets → Create bucket  
   - Bucket name  
   - AWS Region  
   - Tags (key & value)  
   - Create bucket  
   - Upload (upload any file)  

#### AWS SDK Practice – Java and Python (Step by Step)

**PART 1 – Common Setup (For Java and Python)**

**Step 1 – Create AWS Account**  
Go to the AWS Console and create an account.

**Step 2 – Create IAM User**  
1. Open IAM service  
2. Click Users → Create User  
3. Enable Programmatic Access  
4. Attach policies:  
   * AmazonS3FullAccess  
   * AmazonEC2ReadOnlyAccess  
   * AmazonDynamoDBFullAccess  
5. Create user  
6. Download Access Key ID and Secret Access Key  

**Step 3 – Install AWS CLI**  
Command: `aws --version`  
If not installed: `pip install awscli`

**Step 4 – Configure AWS CLI**  
Command: `aws configure`  

Enter:  
Access Key ID  
Secret Access Key  
Region (example: ap-south-1)  
Output format: json  

Now the SDK will automatically use credentials from the CLI.

**PART 2 – AWS SDK with Java (SDK v2)**

**Step 1 – Add Maven Dependencies**

Add these dependencies in `pom.xml`:

```xml
software.amazon.awssdk:s3
software.amazon.awssdk:ec2
software.amazon.awssdk:dynamodb
```

**Java Example 1 – Upload File to S3**  
1. Create `S3Client` using `S3Client.create()`.  
2. Create `PutObjectRequest` with bucket name and key (file name).  
3. Call `putObject()` method.  
4. File will upload successfully.

**Java Example 2 – List EC2 Instances**  
1. Create `Ec2Client` using `Ec2Client.create()`.  
2. Call `describeInstances()`.  
3. Loop through reservations.  
4. Print `instanceId`.

**Java Example 3 – Insert Item into DynamoDB**  
1. Create `DynamoDbClient`.  
2. Create a map.  
3. Add attributes (id, name, etc.).  
4. Create `PutItemRequest` with table name.  
5. Call `putItem()`.

**PART 3 – AWS SDK with Python (boto3)**

**Step 1 – Install boto3**  
Command: `pip install boto3`

**Python Example 1 – Upload File to S3**  
1. Import boto3.  
2. Create client using `boto3.client('s3')`.  
3. Call `upload_file(local_file, bucket_name, key_name)`.

**Python Example 2 – List EC2 Instances**  
1. Create client `boto3.client('ec2')`.  
2. Call `describe_instances()`.  
3. Loop through Reservations.  
4. Print `InstanceId`.

**Python Example 3 – Insert Item into DynamoDB**  
1. Create resource `boto3.resource('dynamodb')`.  
2. Get table using `Table('table_name')`.  
3. Call `put_item()` with an item dictionary.

#### AWS Parameter Store
Steps:
1. AWS Systems Manager  
2. Parameter Store  
3. Create parameter  
   - Name  
   - Value  
   - Tags (any value)  
   - Create parameter  

#### AWS EC2 Instance
Steps:
1. EC2  
2. Instances (running)  
3. Launch Instance  
4. Name & Tags  
5. Application & OS images – Ubuntu 22.04 LTS  
6. Instance type – t2.micro (free tier)  
7. Key pair (login) → Create new key pair  
   - Key name  
   - RSA  
   - .pem  
   - Create key pair  
8. Network settings (0.0.0.0/0) – Anywhere  
   - Create security group  
   - Allow SSH traffic from Anywhere  
   - Allow HTTP traffic from the internet  
   - Allow HTTPS traffic from the internet  
9. Configure storage – 10 GB GP2  
10. Launch instance  
11. Open running instance (instance ID)  
12. Security → Inbound rules – add custom port if needed  
13. Select the instance → Connect → SSH client  
   - Locate your private key file; the key used to launch this instance is the *.pem* file.  
   - Run this command to ensure your key is not publicly viewable:  
     `chmod 400 key.pem`  
   - Connect to your instance using its public DNS:  
     `ssh -i key.pem ubuntu@<public-dns>`

#### Example: User → Laptop → EC2 → IAM User → S3 Bucket (using CLI, not console)
Steps:
1. Create instance.  
2. IAM → Users  
   - Name: `aws-user`  
   - Next → Attach S3, EC2 access → Next → Create user.  
3. S3 → Create bucket  
   - General purpose  
   - Name: `aws-bucket-t`  
   - ACLs disabled  
   - Uncheck “Block all public access” (for public)  
   - Create bucket → Upload something.  
4. Access from CLI (Command Line Interface).  
5. `aws-user` (IAM) → Security credentials → Create access key  
   - CLI → I understand → Next → Create key  
   * Save Access Key ID & Secret Access Key (use them to access bucket data).  
6. EC2 instance → Connect → SSH client.  
7. Open terminal:  
   ```
   cd Downloads
   ls          # check files
   ls -l       # verify permissions (publicly readable)
   chmod 400 key.pem   # restrict so only I can read
   ssh -i key.pem ubuntu@<public-dns>
   # Connected to EC2 instance
   ```
8. Download tool: Search “awscliv2 for Ubuntu” (Chrome).  
9. On the connected instance:  
   ```
   sudo apt install unzip -y
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   ls
   unzip awscliv2.zip
   ls
   sudo ./aws/install
   aws --version
   aws s3 ls
   aws configure
   # AWS Access Key ID: <enter>
   # AWS Secret Access Key: <enter>
   # Default region name: (skip)
   # Default output format: (skip)
   aws s3 ls
   aws s3 ls aws-bucket-t
   aws s3 ls aws-bucket-t/images/
   # (/images/ — manually created folder)
   ```
```
