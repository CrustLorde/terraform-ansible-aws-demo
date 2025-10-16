variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro" # t3.micro is often free-tier eligible
}

variable "ami" {
  description = "AMI ID to use (Ubuntu 22.04 LTS recommended). Update per-region"
  type        = string
  default     = "" # must be set by user or via -var
}

variable "public_key_path" {
  description = "Path to your SSH public key for EC2 key pair"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "key_name" {
  description = "Name for the AWS key pair"
  type        = string
  default     = "terraform-demo-key"
}
