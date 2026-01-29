variable "instance_type" {
  description = "Instance Type of EC2 Instance"
  type = string
  default = "t3.micro"
}

variable "subnet_id" {
  description = "ID of the Subnet"
  type = string
}

variable "vpc_security_group_id" {
  description = "ID of the security group"
  type = string
}

variable "app_name" {
  description = "Name of the application"
  type = string
}