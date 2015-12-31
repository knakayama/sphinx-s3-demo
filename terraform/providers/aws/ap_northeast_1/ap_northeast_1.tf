variable "region"      { }

variable "acl"         { }
variable "policy_file" { }

variable "domain"      { }
variable "sub_domain"  { }

provider "aws" {
  region = "${var.region}"
}

module "website" {
  source = "../../../modules/aws/util/website"

  acl         = "${var.acl}"
  policy_file = "${var.policy_file}"
  domain      = "${var.domain}"
  sub_domain  = "${var.sub_domain}"
}

output "s3_website_endpoint" { value = "${module.website.s3_website_endpoint}" }
output "route53_record_fqdn" { value = "${module.website.route53_record_fqdn}" }
