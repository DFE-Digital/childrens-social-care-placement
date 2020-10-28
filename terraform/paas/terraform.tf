terraform {
  required_version = ">= 0.13.4"
  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.12.6"
    }
  }

  backend "s3" {
    bucket = "${var.bucket_name}"
    region = "eu-west-2"
    access_key = "${var.aws_access_key_id}"
    secret_key = "${var.aws_secret_access_key}"
    key = "store/terraform.tfstate"
  }

}