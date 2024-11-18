# KnowledgeCity Infrastructure

This repository contains Terraform scripts to provision a highly available, secure, and efficient infrastructure on AWS for KnowledgeCity.

## Prerequisites

- Terraform installed on your machine.
- AWS account with appropriate permissions to create resources.
- AWS CLI configured with your credentials.

## Directory Structure



knowledgecity-infrastructure/
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│ ├── vpc/
│ ├── asg/
│ ├── rds/
│ ├── cloudfront/
│ └── iam/
└── README.md


Copy

## Getting Started

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/knowledgecity-infrastructure.git
   cd knowledgecity-infrastructure
Set Up Variables Update the variables.tf file or create a terraform.tfvars file in the root directory with your specific values:

ami_id          = "your-ami-id"
db_username     = "your-db-username"
db_password     = "your-db-password"

Initialize Terraform Run the following command to initialize the Terraform configuration:

**terraform init**

Plan the Infrastructure Execute the following command to see what resources will be created:

**terraform plan** 

Apply the Changes To create the infrastructure, run:

**terraform apply**
Type yes when prompted to confirm.

Outputs After the apply completes, you can view the outputs, such as the RDS endpoint and VPC ID:

**terraform output**

## Cleaning Up

To destroy the infrastructure created by Terraform, run:

**terraform destroy**
Type yes when prompted to confirm.

Notes

Ensure that you monitor your AWS usage to stay within your budget.
Adjust instance types and sizes as needed for performance and cost optimization.

## License
This project is licensed under the MIT License.



### Explanation of the Terraform Setup

1. **Main Configuration**: The `main.tf` file sets up the provider and includes modules for VPC, IAM, RDS, Auto Scaling Groups, and CloudFront.
  
2. **Modules**: Each module is responsible for a specific part of the infrastructure:
   - **VPC**: Creates a Virtual Private Cloud with public and private subnets.
   - **RDS**: Sets up a MySQL database instance.
   - **Auto Scaling Group**: Manages EC2 instances for the API.
   - **CloudFront**: Configures a CDN for static content delivery.
   - **IAM**: Manages roles and policies for secure access.

3. **Variables and Outputs**: Variables are defined to customize configurations, and outputs provide useful information after deployment.

With these scripts and the accompanying README, you should be able to provision the entire infrastructure needed for KnowledgeCity's applications efficiently. If you have any specific questions or need further customization, feel free to ask!
