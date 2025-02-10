Terraform AWS Infrastructure Setup
This README provides a step-by-step guide to setting up an AWS infrastructure using Terraform. The infrastructure includes the following components:

An AWS EC2 instance.
A custom Virtual Private Cloud (VPC) with a Subnet, Internet Gateway, and Route Table.
Security Group to manage network access.
Prerequisites
Before you begin, ensure you have the following:

An AWS account with appropriate permissions.
Terraform installed on your local machine. Download Terraform
AWS CLI configured with your credentials. Configure AWS CLI
Directory Structure

project-directory/
├── main.tf           # Contains the EC2 instance definition
├── vpc.tf            # Contains the VPC, Subnet, Internet Gateway, and Security Group
├── data.tf           # Fetches necessary data (e.g., AMIs)
├── variables.tf      # Variables for configuration
├── outputs.tf        # Outputs for monitoring and debugging
├── backend.tf        # Backend configuration for state management
└── README.md         # Documentation for the setup
Steps to Set Up
1.⁠ ⁠Clone the Repository
Clone this repository to your local machine or create a new Terraform project directory:

git clone https://github.com/zolabest/DevOps-k8s-cluster-deployment.git
cd terraform-aws-setup
2.⁠ ⁠Define Your Variables
Update the variables.tf file to define your AWS region or any other required variables:

variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"
}
3.⁠ ⁠Configure the Backend
In backend.tf, configure the remote backend for state management:

terraform {
  backend "s3" {
    bucket         = "your-backend-bucket"
    key            = "terraform/state"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "your-dynamodb-lock-table"
  }
}
4.⁠ ⁠Initialize Terraform
Run the following command to initialize Terraform and install necessary providers:


terraform init
5.⁠ ⁠Plan the Infrastructure
Preview the resources Terraform will create:


terraform plan
6.⁠ ⁠Apply the Configuration
Deploy the resources:

terraform apply
Type yes when prompted to confirm the changes.

Components Created
VPC
A VPC with CIDR block 10.0.0.0/16.
A public Subnet with CIDR block 10.0.1.0/24.
Internet Gateway and Route Table for external connectivity.
EC2 Instance
AMI ID fetched dynamically using a data object.
Instance type: t2.micro.
Deployed within the custom VPC and Subnet.
Associated with a Security Group that allows SSH (port 22) and HTTP (port 80).
Security Group
Ingress rules:
Allow SSH (port 22) from anywhere (0.0.0.0/0).
Allow HTTP (port 80) from anywhere (0.0.0.0/0).
Egress rules:
Allow all traffic (0.0.0.0/0).
Outputs
After applying the configuration, Terraform will display the following outputs:

Instance ID: The unique ID of the EC2 instance.
Public IP: The public IP address of the EC2 instance.
VPC ID: The ID of the created VPC.
Subnet ID: The ID of the created Subnet.
Cleanup
To delete the resources and avoid ongoing costs, run:


terraform destroy
Type yes when prompted.

Notes
Modify the vpc.tf file if you need additional subnets or custom CIDR blocks.
Use terraform fmt to format your Terraform code for consistency.
