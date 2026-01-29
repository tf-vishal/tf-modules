resource "aws_security_group" "web" {
    vpc_id = var.vpc_id
    name = "${var.app_name}-web-sg"

    # Now for better functionality we write the ingress and egress rules sepereately.

    tags = {
        Name = "${var.app_name}-web-sg"
    }

}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
    # For http
    security_group_id = aws_security_group.web.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 80
    ip_protocol = "tcp"
    to_port = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
    # For SSH
    security_group_id = aws_security_group.web.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
    # For https
    security_group_id = aws_security_group.web.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 443
    ip_protocol = "tcp"
    to_port = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_tls_ipv4" {
    security_group_id = aws_security_group.web.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 0
    to_port = 0
    ip_protocol = "-1"
}