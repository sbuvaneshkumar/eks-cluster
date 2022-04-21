# Terraform Block
terraform {
  backend "s3" {
    bucket = "c4-us-east-1-priv-tf-backend"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}
