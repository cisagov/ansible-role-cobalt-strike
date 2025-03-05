# Create the role that is allowed read-only access to the particular S3
# objects that are required by this Ansible role
module "bucket_access" {
  source = "github.com/cisagov/s3-read-role-tf-module"
  providers = {
    aws = aws.images_provisionthirdpartybucketreadroles
  }

  account_ids = [data.aws_caller_identity.current.account_id]
  entity_name = module.user.user.name
  role_name   = "ThirdPartyBucketRead-${module.user.user.name}"
  s3_bucket   = var.cobalt_strike_bucket
  s3_objects  = var.cobalt_strike_objects
}

# Attach the bucket access policy to the role used by the test user
resource "aws_iam_role_policy_attachment" "bucket_access" {
  provider = aws.images_provisionaccount

  policy_arn = module.bucket_access.policy.arn
  role       = module.user.role.name
}
