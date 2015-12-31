variable "name"                { }
variable "vpc_id"              { }
variable "key_name"            { }
variable "public_subnet_id"    { }
variable "web_instance_type"   { }
variable "web_instance_ami_id" { }
variable "domain"              { }
variable "sub_domain"          { }

module "web" {
  source = "./web"

  name              = "${var.name}-web"
  vpc_id            = "${var.vpc_id}"
  key_name          = "${var.key_name}"
  public_subnet_id  = "${var.public_subnet_id}"
  instance_type     = "${var.web_instance_type}"
  instance_ami_id   = "${var.web_instance_ami_id}"
  domain            = "${var.domain}"
  sub_domain        = "${var.sub_domain}"
}

output "web_public_ip"       { value = "${module.web.public_ip}" }
output "route53_record_fqdn" { value = "${module.web.route53_record_fqdn}" }
