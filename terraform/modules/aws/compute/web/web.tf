variable "name"             { default = "web" }
variable "vpc_id"           { }
variable "key_name"         { }
variable "public_subnet_id" { }
variable "instance_type"    { }
variable "instance_ami_id"  { }
variable "domain"           { }
variable "sub_domain"       { }

resource "aws_security_group" "web" {
  name        = "${var.name}"
  vpc_id      = "${var.vpc_id}"
  description = "Web security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags { Name = "${var.name}" }
}

resource "aws_instance" "web" {
  ami           = "${var.instance_ami_id}"
  subnet_id     = "${var.public_subnet_id}"
  key_name      = "${var.key_name}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids      = ["${aws_security_group.web.id}"]
  associate_public_ip_address = false

  root_block_device = {
    volume_type = "gp2"
    volume_size = 8
  }

  tags { Name = "${var.name}" }
}

resource "aws_eip" "web" {
  vpc = true
  instance = "${aws_instance.web.id}"
}

resource "aws_route53_zone" "web" {
  name = "${var.domain}"
}

resource "aws_route53_record" "web" {
  name    = "${var.sub_domain}.${var.domain}"
  zone_id = "${aws_route53_zone.web.zone_id}"
  type    = "A"
  ttl     = 60
  records = ["${aws_eip.web.public_ip}"]
}

output "public_ip"           { value = "${aws_eip.web.public_ip}" }
output "route53_record_fqdn" { value = "${aws_route53_record.web.fqdn}" }
