terraform {
  backend "s3" {
    # Use a partial configuration to avoid hardcoding the bucket name. This
    # allows the bucket name to be set on a per-environment basis via the
    # -backend-config command line option or other methods.  For details, see:
    # https://developer.hashicorp.com/terraform/language/backend#partial-configuration
    bucket         = ""
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "skeleton-ansible-role-with-test-user/terraform.tfstate"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
  }
}
