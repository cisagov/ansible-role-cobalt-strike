# ------------------------------------------------------------------------------
# Retrieve state data from a Terraform backend. This allows use of the
# root-level outputs of one or more Terraform configurations as input
# data for this configuration.
# ------------------------------------------------------------------------------

data "terraform_remote_state" "images" {
  backend = "s3"

  config = {
    bucket         = var.terraform_state_bucket
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-accounts/images.tfstate"
    profile        = "cool-terraform-readstate"
    region         = "us-east-1"
  }

  workspace = terraform.workspace
}

data "terraform_remote_state" "images_ssm" {
  backend = "s3"

  config = {
    bucket         = var.terraform_state_bucket
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-images-parameterstore/terraform.tfstate"
    profile        = "cool-terraform-readstate"
    region         = "us-east-1"
  }

  workspace = terraform.workspace
}

data "terraform_remote_state" "users" {
  backend = "s3"

  config = {
    bucket         = var.terraform_state_bucket
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-accounts/users.tfstate"
    profile        = "cool-terraform-readstate"
    region         = "us-east-1"
  }

  workspace = terraform.workspace
}
