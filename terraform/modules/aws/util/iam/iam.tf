variable "name"       { default = "iam" }
variable "user"       { }
variable "domain"     { }
variable "sub_domain" { }

variable "rel_path" {
  default = "../../../modules/aws/util/iam/"
}

resource "template_file" "mod" {
  template = "${file(concat(var.rel_path, "policy.json.tpl"))}"

  vars {
    user   = "${var.user}"
    backet = "${var.sub_domain}.${var.domain}"
  }
}

resource "aws_iam_user" "mod" {
  name = "${var.user}"
}

resource "aws_iam_user_policy" "mod" {
  name   = "${var.user}"
  user   = "${aws_iam_user.mod.name}"
  policy = "${template_file.mod.rendered}"
}

resource "aws_iam_access_key" "mod" {
  user = "${aws_iam_user.mod.name}"
}

output "user"       { value = "${aws_iam_access_key.mod.user}" }
output "access_id"  { value = "${aws_iam_access_key.mod.id}" }
output "secret_key" { value = "${aws_iam_access_key.mod.secret}" }
