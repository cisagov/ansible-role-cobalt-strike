# Create the test user
module "user" {
  source = "github.com/cisagov/molecule-iam-user-tf-module?ref=improvement%2Fmodern-env"

  providers = {
    aws                         = aws.users
    aws.images-provisionaccount = aws.images_provisionaccount
    aws.images-ssm              = aws.images_ssm
  }

  entity = "ansible-role-cobalt-strike"

  # No SSM access is needed for this user, but ssm_parameters cannot be empty
  ssm_parameters = ["/not/used"]
}
