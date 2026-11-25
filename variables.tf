variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Prefix used in resource names and tags"
  type        = string
  default     = "capstone-p1"
}

variable "vpc_id" {
  description = "Existing VPC to deploy into"
  type        = string
  default     = "vpc-0f7e777c109ac7bad"
}

variable "public_route_table_id" {
  description = "Existing route table that routes 0.0.0.0/0 to an internet gateway"
  type        = string
  default     = "rtb-01956fc25e09d75bc"
}

variable "subnet_cidr" {
  description = "New subnet CIDR: must be inside the VPC range and not overlap existing subnets"
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ssh_cidr" {
  description = "CIDR allowed to SSH in. Set to your IP, e.g. 203.0.113.10/32"
  type        = string
  default     = "0.0.0.0/0"
}

variable "key_name" {
  description = "Optional existing EC2 key pair name for SSH. Leave null to skip."
  type        = string
  default     = null
}
