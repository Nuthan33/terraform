terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create 2 EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0427090fd1714168b" # Amazon Linux
  instance_type = "t2.micro"
  count         = 2
  tags = {
    #"Name" = "web"
    "Name" = "web-${count.index}"
  }
}
