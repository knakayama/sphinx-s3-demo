variable "name"      { }
variable "region"    { }
variable "iam_admin" { }

provider "aws" {
  region = "${var.region}"
}

module "iam" {
  source = "../../../modules/aws/util/iam"

  name = "my-${var.name}"
  user = "${var.iam_admin}"
}

output "user"       { value = "${module.iam.user}" }
output "access_id"  { value = "${module.iam.access_id}" }
output "secret_key" { value = "${module.iam.secret_key}" }
