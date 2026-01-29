module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  app_name = var.app_name
}

module "security_group" {
  source = "./modules/security-grp"
  vpc_id = module.vpc.vpc_id
  app_name = var.app_name
}

module "ec2" {
  source = "./modules/ec2"
  instance_type = "t3.micro"
  subnet_id = module.vpc.subnet_id
  vpc_security_group_id = module.security_group.security_group_id
  app_name = var.app_name
  
}