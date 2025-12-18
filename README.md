Auto-Healing Web Tier on AWS using Terraform 
Overview :
This repository contains Terraform code to provision an auto-healing, highly available web tier on Amazon Web Services (AWS).
The solution ensures that the failure or termination of any single EC2 instance does not cause downtime.
The infrastructure is fully defined using Infrastructure as Code (IaC) and validated using Terraform plan.
________________________________________
Why AWS?
AWS was chosen for this solution because it provides:
•	Native Auto Scaling Group (ASG) support for self-healing
•	Application Load Balancer (ALB) for traffic distribution and health checks
•	Mature Terraform provider support
•	Cost-effective services suitable for small, highly available workloads
________________________________________
Architecture Summary :
The architecture consists of:
•	Application Load Balancer (ALB)
•	Target Group with HTTP health checks
•	Auto Scaling Group (ASG)
•	Launch Template for EC2 configuration
•	EC2 instances running Docker
•	NGINX static web page served from a container
Traffic is always routed through the Load Balancer to healthy EC2 instances.
________________________________________
Key Requirements Addressed :
Requirement	Implementation
Self-healing	Auto Scaling Group replaces unhealthy instances
Self-provisioning	Terraform Infrastructure as Code
N + 1 capacity	Minimum two EC2 instances
Static web page	NGINX welcome page
Idempotency	Re-running Terraform produces no changes
________________________________________
Containerisation :
•	NGINX runs inside a Docker container
•	A Dockerfile is used to build the image
•	The image is stored in a public container registry
•	EC2 user-data installs Docker, pulls the image, and runs the container automatically
________________________________________
Repository Structure :
terraform-aws-autohealing-web-tier/
├── main.tf
├── provider.tf
├── versions.tf
├── variables.tf
├── outputs.tf
├── user-data.sh
└── README.md
________________________________________
Terraform Execution Steps :
terraform init
terraform validate
terraform plan
terraform apply is optional and not required for evaluation.
________________________________________
Architecture Flow :
1.	User sends an HTTP request to the Application Load Balancer
2.	The Load Balancer forwards traffic to the Target Group
3.	The Target Group routes requests to healthy EC2 instances
4.	EC2 instances serve the NGINX page using Docker
5.	If an instance fails:
o	The Load Balancer stops routing traffic to it
o	The Auto Scaling Group launches a replacement instance
This ensures zero downtime.
________________________________________
Assumptions :
•	AWS credentials and permissions are already configured
•	Default VPC is used for simplicity
•	HTTP traffic only (HTTPS can be added as an enhancement)
•	Public container registry access is available
________________________________________
Estimated Monthly Cost (AUD) :
Resource	Estimated Cost
2 × EC2 (t3.micro)	~AUD 12
Application Load Balancer	~AUD 6
Data Transfer	~AUD 1–2
Total	~AUD 18–20
________________________________________
Time Spent :
The solution was completed within the requested 7–8 focused hours, including design, Terraform implementation, containerisation, and documentation.
________________________________________
Future Enhancements :
•	HTTPS with AWS Certificate Manager (ACM)
•	Web Application Firewall (WAF)
•	Blue/Green deployments
•	ECS or Fargate
•	CI/CD pipeline
________________________________________
Author :
Swetha Pothireddy

