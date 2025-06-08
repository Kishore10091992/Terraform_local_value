variable "instance_type" {
 description = "ec2 instance type"
 type = string
 default = "t2.micro"
}

variable "environment" {
 description = "project environment"
 type = string
 default = "dev"
}

variable "aws_region" {
 description = "AWS region to deploy resources"
 type = string
 default = "us-east-1"
}

variable "number_of_inst" {
 description = "no of instance to create"
 type = number
 default = 2
}

variable "linux_ami" {
 description = "AMI most recent"
 type = bool
 default = true
}