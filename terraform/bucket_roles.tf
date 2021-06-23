# Create the roles that allow read-only access to the particular S3
# objects that are required by this Ansible role
#
# Note that only the production role gets the additional role tags.
# This is because the additional tags being applied mark the role as
# being _the_ role to assume by this repo's AWS test user before
# running molecule test. We create both a production and a staging
# policy because any Packer repos that use this Ansible role will
# attach the production or staging policy to the corresponding
# production or staging Packer role; the production or staging Packer
# role is assumed by the AWS Packer build user depending on whether a
# production or staging AMI is being used, respectively.
module "production_bucket_access" {
  source = "github.com/cisagov/s3-read-role-tf-module"
  providers = {
    aws = aws.images_production
  }

  account_ids = [data.aws_caller_identity.current.account_id]
  additional_role_tags = {
    "GitHub_Secret_Name"             = "TEST_ROLE_TO_ASSUME",
    "GitHub_Secret_Terraform_Lookup" = "arn"
  }
  entity_name = aws_iam_user.user.name
  role_name   = "ThirdPartyBucketRead-${aws_iam_user.user.name}"
  s3_bucket   = var.production_bucket_name
  s3_objects  = var.production_objects
}
module "staging_bucket_access" {
  source = "github.com/cisagov/s3-read-role-tf-module"
  providers = {
    aws = aws.images_staging
  }

  account_ids = [data.aws_caller_identity.current.account_id]
  entity_name = aws_iam_user.user.name
  role_name   = "ThirdPartyBucketRead-${aws_iam_user.user.name}"
  s3_bucket   = var.staging_bucket_name
  s3_objects  = var.staging_objects
}
