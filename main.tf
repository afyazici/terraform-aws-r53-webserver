provider "aws" {
  region = var.region
}


resource "aws_security_group" "project-iac-sg" {
  name        = var.secgroupname
  description = var.secgroupname
  vpc_id      = var.vpc

  // To Allow SSH Transport
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 80 Transport
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 443 Transport
  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 53
    protocol    = "tcp"
    to_port     = 53
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 53
    protocol    = "udp"
    to_port     = 53
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_instance" "project-iac" {
  ami                         = var.ami
  instance_type               = var.itype
  subnet_id                   = var.subnet
  associate_public_ip_address = var.publicip
  key_name                    = var.keyname


  vpc_security_group_ids = [
    aws_security_group.project-iac-sg.id
  ]
  root_block_device {
    delete_on_termination = true
    volume_size           = 50
    volume_type           = "gp2"
  }
  tags = {
    Name        = "NewInstance"
    Environment = "DEV"
    OS          = "UBUNTU"
    Managed     = "IAC"
  }

}

output "ec2instance" {
  value = aws_instance.project-iac.public_ip
}


resource "aws_route53_record" "root_domain" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = "300"
  records = [aws_instance.project-iac.public_ip]
}

resource "aws_route53_record" "www_domain" {
  zone_id = var.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.project-iac.public_ip]
}

resource "null_resource" "write_host_ip" {
  depends_on = [aws_instance.project-iac]
  provisioner "local-exec" {
    command = <<-EOT
      sleep 30
      echo "${aws_instance.project-iac.public_ip}" >> hosts.ini
    EOT
  }
}


resource "null_resource" "hoscheck_false" {
  depends_on = [null_resource.write_host_ip]
  provisioner "local-exec" {
    command = <<-EOT
      export ANSIBLE_HOST_KEY_CHECKING=False
    EOT
  }
}


resource "null_resource" "run_ansible_playbook" {
  depends_on = [null_resource.hoscheck_false]
  provisioner "local-exec" {
    command = <<-EOT
      ansible-playbook -i hosts.ini -u ubuntu --private-key "${var.private_key_path}" main.yml
    EOT
  }
}
