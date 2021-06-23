# ------------------------------------------------------------------------------
# Retrieve state data from a Terraform backend. This allows use of the
# root-level outputs of one or more Terraform configurations as input
# data for this configuration.
# ------------------------------------------------------------------------------

data "terraform_remote_state" "images_staging" {
  backend = "s3"

  config = {
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-accounts/images.tfstate"
    profile        = "cool-terraform-readstate"
    region         = "us-east-1"
  }

  workspace = "staging"
}

data "terraform_remote_state" "images_production" {
  backend = "s3"

  config = {
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-accounts/images.tfstate"
    profile        = "cool-terraform-readstate"
    region         = "us-east-1"
  }

  workspace = "production"
}

data "terraform_remote_state" "users" {
  backend = "s3"

  config = {
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "cool-accounts/users.tfstate"
    profile        = "cool-terraform-readstate"
    region         = "us-east-1"
  }

  workspace = "production"
}
