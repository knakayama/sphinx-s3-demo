variable "bucket_doc"     { }
variable "bucket_tfstate" { }
variable "region"         { }
variable "iam_admin"      { }

provider "aws" {
  region = "${var.region}"
}

module "iam" {
  source = "../../../modules/aws/util/iam"

  user          = "${var.iam_admin}"
  bucket_doc    = "${var.bucket_doc}"
  bucket_tfstate = "${var.bucket_tfstate}"
}

output "user"       { value = "${module.iam.user}" }
output "access_id"  { value = "${module.iam.access_id}" }
output "secret_key" { value = "${module.iam.secret_key}" }
