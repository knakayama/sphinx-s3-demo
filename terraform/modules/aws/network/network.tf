variable "name"          {}
variable "az"            {}
variable "vpc_cidr"      {}
variable "public_subnet" {}

module "vpc" {
  source = "./vpc"

  name = "${var.name}-vpc"
  cidr = "${var.vpc_cidr}"
}

module "public_subnet" {
  source = "./public_subnet"

  name   = "${var.name}-public"
  vpc_id = "${module.vpc.id}"
  cidr   = "${var.public_subnet}"
  az     = "${var.az}"
}

resource "aws_network_acl" "acl" {
  vpc_id     = "${module.vpc.id}"
  subnet_ids = ["${module.public_subnet.subnet_id}"]

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

# VPC
output "vpc_id" { value = "${module.vpc.id}" }

# Subnets
output "public_subnet_id" { value = "${module.public_subnet.subnet_id}" }
