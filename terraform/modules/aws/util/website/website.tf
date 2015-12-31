variable "acl"         { }
variable "policy_file" { }
variable "domain"      { }
variable "sub_domain"  { }

variable "rel_path" {
  default = "../../../modules/aws/util/website/"
}

resource "template_file" "website" {
  template = "${file(concat(var.rel_path, "policy.json.tpl"))}"

  vars {
    backet_name = "${var.sub_domain}.${var.domain}"
  }
}

resource "aws_s3_bucket" "website" {
  bucket = "${var.sub_domain}.${var.domain}"
  acl    = "${var.acl}"
  policy = "${template_file.website.rendered}"
  force_destroy = true

  website {
    index_document = "index.html"
  }
}

resource "aws_route53_zone" "website" {
  name = "${var.domain}"
}

resource "aws_route53_record" "website" {
  zone_id = "${aws_route53_zone.website.zone_id}"
  name    = "${var.sub_domain}.${var.domain}"
  type    = "A"

  alias {
    name    = "${aws_s3_bucket.website.website_domain}"
    zone_id = "${aws_s3_bucket.website.hosted_zone_id}"
    evaluate_target_health = false
  }
}

output "s3_website_endpoint" { value = "${aws_s3_bucket.website.website_endpoint}" }
output "route53_record_fqdn" { value = "${aws_route53_record.website.fqdn}" }
