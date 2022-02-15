provider "aws" {
  region = "ap-south-1"
}

variable "subnet_cidr_block" {
  description = "Subnet CIDR Block to be used for the VPC"
  type        = list(string)
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block to be used for the VPC"
}

variable "environment" {
  description = "Deployment environment"
}

resource "aws_vpc" "development-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.environment
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id            = aws_vpc.development-vpc.id
  cidr_block        = var.subnet_cidr_block[0]
  availability_zone = "ap-south-1a"
  tags = {
    Name = "subnet-1-dev"
  }
}

