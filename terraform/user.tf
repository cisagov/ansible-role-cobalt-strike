# Create the test user
module "user" {
  source = "github.com/cisagov/molecule-iam-user-tf-module"

  providers = {
    aws                         = aws.users
    aws.images-provisionaccount = aws.images_provisionaccount
    aws.images-ssm              = aws.images_ssm
  }

  entity = "skeleton-ansible-role-with-test-user"

  # If necessary, provide a list of SSM parameters that the test user needs to
  # be able to read
  # ssm_parameters = ["/example/parameter"]
}
