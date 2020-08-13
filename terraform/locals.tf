# ------------------------------------------------------------------------------
# Retrieve the effective Account ID, User ID, and ARN in which
# Terraform is authorized.  This is used to calculate the session
# names for assumed roles.
# ------------------------------------------------------------------------------
data "aws_caller_identity" "current" {}

# ------------------------------------------------------------------------------
# Evaluate expressions for use throughout this configuration.
# ------------------------------------------------------------------------------
locals {
  # Extract the user name of the current caller for use
  # as assume role session names.
  caller_user_name = split("/", data.aws_caller_identity.current.arn)[1]
}
