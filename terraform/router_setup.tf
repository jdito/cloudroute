terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "router" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  key_name      = "default-key"
  subnet_id     = aws_subnet.a.id
  security_groups = [
    aws_security_group.allow_outbound.id,
    aws_security_group.allow_icmp.id,
    aws_security_group.allow_openvpn.id,
    aws_security_group.allow_ssh.id
  ]

  tags = {
    Name = "router"
  }
}

resource "aws_network_interface" "secondary" {
  subnet_id = aws_subnet.b.id
  security_groups = [
    aws_security_group.allow_outbound.id,
    aws_security_group.allow_icmp.id,
    aws_security_group.allow_openvpn.id,
    aws_security_group.allow_ssh.id
  ]

  attachment {
    instance     = aws_instance.router.id
    device_index = 1
  }
}

resource "aws_eip" "secondary" {
  network_interface = aws_network_interface.secondary.id
}

resource "aws_route53_record" "router" {
  zone_id = var.zone_id
  name    = "router"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.router.public_ip]
}

resource "aws_route53_record" "eth0" {
  zone_id = var.zone_id
  name    = "eth0.router"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.router.public_ip]
}

resource "aws_route53_record" "eth1" {
  zone_id = var.zone_id
  name    = "eth1.router"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.secondary.public_ip]
}
