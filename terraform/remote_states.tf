# ------------------------------------------------------------------------------
# Retrieve state data from a Terraform backend. This allows use of the
# root-level outputs of one or more Terraform configurations as input
# data for this configuration.
# ------------------------------------------------------------------------------

data "terraform_remote_state" "images_staging" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-readstate"
    region         = "us-east-1"
    key            = "cool-accounts/images.tfstate"
  }

  workspace = "staging"
}

data "terraform_remote_state" "images_production" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-readstate"
    region         = "us-east-1"
    key            = "cool-accounts/images.tfstate"
  }

  workspace = "production"
}

data "terraform_remote_state" "images_staging_ssm" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-readstate"
    region         = "us-east-1"
    key            = "cool-images-parameterstore/terraform.tfstate"
  }

  workspace = "staging"
}

data "terraform_remote_state" "images_production_ssm" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-readstate"
    region         = "us-east-1"
    key            = "cool-images-parameterstore/terraform.tfstate"
  }

  workspace = "production"
}

data "terraform_remote_state" "users" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-readstate"
    region         = "us-east-1"
    key            = "cool-accounts/users.tfstate"
  }

  workspace = "production"
}
