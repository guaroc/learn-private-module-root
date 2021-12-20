terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}

module "ec2-private" {
  source  = "app.terraform.io/example-org-68fb71/ec2-private/aws"
  version = "1.0.6"
  
  prefix            = "digory"
  region_name       = var.region
  ec2_instance_type = "t2.micro"
  ec2_ami           = "ami-024221a59c9020e72"
  subnet_id         = "subnet-096dc1d1e7fccabe2"
  vpc_id            = "vpc-0d58cc6e5455b9c7a"
  vpc_cidr_blocks   = "173.26.0.0/16"

  tags = {
    "Project"     = "Demo"
    "Purpose"     = "Demonstrate module in Terraform"
    "Envrionment" = "DEV"
  }  
}
