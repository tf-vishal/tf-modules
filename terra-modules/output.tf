output "public_ip" {
  description = "Public IP"
  value = module.ec2.public_ip
}