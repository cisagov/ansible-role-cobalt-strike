# Create the test user
module "user" {
  source = "github.com/cisagov/molecule-iam-user-tf-module?ref=improvement%2Fmodern-env"

  providers = {
    aws                         = aws.users
    aws.images-provisionaccount = aws.images_provisionaccount
    aws.images-ssm              = aws.images_ssm
  }

  entity         = "skeleton-ansible-role-with-test-user"
  ssm_parameters = ["/example/parameter"]
}
