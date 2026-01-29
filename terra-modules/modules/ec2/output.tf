output "public_ip" {
  description = "Public Ip of the instance:"
  value = aws_instance.web.public_ip
}