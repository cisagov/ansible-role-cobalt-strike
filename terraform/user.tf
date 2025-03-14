# Create the test user
module "user" {
  source = "github.com/cisagov/molecule-iam-user-tf-module"

  providers = {
    aws                         = aws.users
    aws.images-provisionaccount = aws.images_provisionaccount
    aws.images-ssm              = aws.images_ssm
  }

  entity = "skeleton-ansible-role-with-test-user"
  # If necessary, provide a list of SSM Parameter Store parameters that the test user needs to
  # be able to read.  In particular, roles that require access to
  # resources inside the third-party bucket will likely need to access the
  # name of that bucket via such a parameter.
  # ssm_parameters = ["/third_party_bucket_name"]
}
