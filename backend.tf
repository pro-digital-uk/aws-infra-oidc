terraform {
  backend "s3" {
    bucket  = "terraform-state-493245399435"
    key     = "aws-infra-oidc/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}
