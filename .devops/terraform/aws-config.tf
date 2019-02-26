# Specify the provider and access details
provider "aws" {
  access_key = "${var.aws_access["access_key"]}"
  secret_key = "${var.aws_access["secret_key"]}"
  region     = "us-east-1"
}
