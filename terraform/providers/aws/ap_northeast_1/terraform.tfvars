# General
name   = "sphinx-s3"
region = "ap-northeast-1"

# Network
vpc_cidr      = "172.16.0.0/16"
az            = "ap-northeast-1a"
public_subnet = "172.16.0.0/24"

# Web
web_instance_type   = "t2.micro"
web_instance_ami_id = "ami-8d1021e3"

# S3
policy_file = "policy.json.tpl"
bucket      = "my-sphinx-s3"

# Route53
domain     = "YOUR_DOMAIN_HERE"
sub_domain = "YOUR_SUB_DOMAIN_HERE"
