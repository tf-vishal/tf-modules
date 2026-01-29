variable "app_name" {
  description = "Simple HTML page Web Application"
  type = string
}

variable "vpc_cidr" {
  description = "CIDR range for VPC"
  type = string
}

variable "subnet_cidr" {
  description = "CIDR range for Subnet"
  type = string
}