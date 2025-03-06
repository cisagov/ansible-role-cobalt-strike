# This is the "default" provider that is used assume the roles in the
# other providers.  It uses the credentials of the caller.  It is also
# used to assume the roles required to access remote state in the
# Terraform backend.
provider "aws" {
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create the role that can be assumed to do
# everything the CI user needs to do in the Images account.
provider "aws" {
  alias = "images_provisionaccount"
  assume_role {
    role_arn     = data.terraform_remote_state.images.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create roles that can read certificates from the
# third-party software S3 bucket in the Images account.
provider "aws" {
  alias = "images_provisionthirdpartybucketreadroles"
  assume_role {
    role_arn     = data.terraform_remote_state.images.outputs.provisionthirdpartybucketreadroles_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create policies and roles that can read
# parameters from AWS SSM Parameter Store in the Images account.
provider "aws" {
  alias = "images_ssm"
  assume_role {
    role_arn     = data.terraform_remote_state.images_ssm.outputs.provisionparameterstorereadroles_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}

# The provider used to create the test user
provider "aws" {
  alias = "users"
  assume_role {
    role_arn     = data.terraform_remote_state.users.outputs.provisionaccount_role.arn
    session_name = local.caller_user_name
  }
  default_tags {
    tags = var.tags
  }
  region = var.aws_region
}
