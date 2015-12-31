variable "name"          { default = "website" }
variable "acl"           { }
variable "policy_file"   { }
variable "web_public_ip" { }

variable "rel_path" {
  default = "../../../modules/aws/util/website/"
}

resource "template_file" "website" {
  template = "${file(concat(var.rel_path, "policy.json.tpl"))}"

  vars {
    backet = "${var.name}"
    web_public_ip = "${var.web_public_ip}"
  }
}

resource "aws_s3_bucket" "website" {
  bucket = "${var.name}"
  acl    = "${var.acl}"
  policy = "${template_file.website.rendered}"
  force_destroy = true

  website {
    index_document = "index.html"
  }
}

output "s3_website_endpoint" { value = "${aws_s3_bucket.website.website_endpoint}" }
