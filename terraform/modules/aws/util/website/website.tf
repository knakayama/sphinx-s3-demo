variable "policy_file"   { }
variable "web_public_ip" { }
variable "bucket"    { }

resource "template_file" "website" {
  template = "${file(concat(path.module, "/policy.json.tpl"))}"

  vars {
    bucket = "${var.bucket}"
    web_public_ip = "${var.web_public_ip}"
  }
}

resource "aws_s3_bucket" "website" {
  bucket = "${var.bucket}"
  acl    = "public-read"
  policy = "${template_file.website.rendered}"
  force_destroy = true

  website {
    index_document = "index.html"
  }
}

output "website_endpoint" { value = "${aws_s3_bucket.website.website_endpoint}" }
