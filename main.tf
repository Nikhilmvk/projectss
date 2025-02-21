# Provider Configuration - AWS
provider "aws" {
  region = "us-east-1"
}

# Define Variables
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

# Create an EC2 Instance
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "AppServer"
  }
}

# Output the Public IP of the EC2 Instance
output "instance_public_ip" {
  description = "Public IP of the deployed EC2 instance"
  value       = aws_instance.app_server.public_ip
}
