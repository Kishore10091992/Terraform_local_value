terraform {
 cloud {
  organization = "1st_Terraform_Cloud"

  workspaces {
   name = "Terraform_local_value"
  }
 }

 required_providers {
  aws = {
   source = "hashicorp/aws"
   version = "~> 5.0"
  }
 }
}

provider "aws" {
 region = var.aws_region
}

locals {
 project_name = "Testing_local_value"
 full_name = "${local.project_name}-${var.environment}"

 tags = {
  project_name = local.project_name
  environment = var.environment
  owner = "Team-A"
 }
}

data "aws_subnet" "existing_subnet" {
 id = "subnet-0e002c3dc85ba7f1d"
}

data "aws_ami" "latest_linux_ami" {
 most_recent = var.linux_ami
 owners = ["amazon"]

 filter {
  name = "name"
  values = ["amzn2-ami-hvm-*"]
 }
}

data "aws_key_pair" "existing_keypair" {
 key_name = "Terraform_ec2"
}

data "aws_security_group" "existing_sg" {
 id = "sg-02a9db5a3c6df8356"
}

resource "aws_instance" "local_value_ec2" {
 ami = data.aws_ami.latest_linux_ami.id
 instance_type = var.instance_type
 key_name = data.aws_key_pair.existing_keypair.key_name
 subnet_id = data.aws_subnet.existing_subnet.id
 security_groups = [data.aws_security_group.existing_sg.id]
 count = var.number_of_inst

 tags = {
  Name = local.full_name
 }
}