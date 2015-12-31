variable "name"       { }
variable "region"     { }
variable "iam_admin"  { }
variable "domain"     { }
variable "sub_domain" { }

provider "aws" {
  region = "${var.region}"
}

module "iam" {
  source = "../../../modules/aws/util/iam"

  name       = "${var.name}-admin"
  user       = "${var.iam_admin}"
  domain     = "${var.domain}"
  sub_domain = "${var.sub_domain}"
}

output "user"       { value = "${module.iam.user}" }
output "access_id"  { value = "${module.iam.access_id}" }
output "secret_key" { value = "${module.iam.secret_key}" }
