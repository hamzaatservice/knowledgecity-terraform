provider "aws" {
  region = "saudi-arabia"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"
}

module "iam" {
  source = "./modules/iam"
}

module "rds" {
  source = "./modules/rds"

  db_instance_class = "db.t3.micro"
  db_name          = "knowledgecity"
  db_username      = var.db_username
  db_password      = var.db_password
}

module "asg" {
  source = "./modules/asg"

  ami_id           = var.ami_id
  instance_type    = var.instance_type
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  desired_capacity  = 2
  max_size         = 5
  min_size         = 1
}

module "cloudfront" {
  source = "./modules/cloudfront"

  origin_domain_name = "example.com"  # Replace with your domain or S3 bucket
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "rds_endpoint" {
  value = module.rds.endpoint
}
