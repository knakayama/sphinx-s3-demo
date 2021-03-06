variable "name"            { }
variable "region"          { }
variable "site_public_key" { }

variable "web_instance_type"   { }
variable "web_instance_ami_id" { }

variable "az"            { }
variable "vpc_cidr"      { }
variable "public_subnet" { }

variable "policy_file" { }
variable "bucket"      { }

variable "domain"      { }
variable "sub_domain"  { }

provider "aws" {
  region = "${var.region}"
}

resource "aws_key_pair" "site_key" {
  key_name   = "${var.name}"
  public_key = "${var.site_public_key}"
}

module "network" {
  source = "../../../modules/aws/network"

  name          = "${var.name}"
  vpc_cidr      = "${var.vpc_cidr}"
  az            = "${var.az}"
  public_subnet = "${var.public_subnet}"
}

module "compute" {
  source = "../../../modules/aws/compute"

  name                = "${var.name}"
  vpc_id              = "${module.network.vpc_id}"
  public_subnet_id    = "${module.network.public_subnet_id}"
  key_name            = "${aws_key_pair.site_key.key_name}"
  web_instance_type   = "${var.web_instance_type}"
  web_instance_ami_id = "${var.web_instance_ami_id}"
}

module "website" {
  source = "../../../modules/aws/util/website"

  bucket        = "${var.bucket}"
  policy_file   = "${var.policy_file}"
  web_public_ip = "${module.compute.web_public_ip}"
}

module "dns" {
  source = "../../../modules/aws/util/dns"

  domain        = "${var.domain}"
  sub_domain    = "${var.sub_domain}"
  web_public_ip = "${module.compute.web_public_ip}"
}

output "web_public_ip"    { value = "${module.compute.web_public_ip}" }
output "route53_fqdn"     { value = "${module.dns.route53_fqdn}" }
output "website_endpoint" { value = "${module.website.website_endpoint}" }
