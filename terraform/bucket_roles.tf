# Create the roles that allow read-only access to the particular S3
# objects that are required by this Ansible role
module "production_bucket_access" {
  source = "github.com/cisagov/s3-read-role-tf-module"
  providers = {
    aws = aws.images_production
  }

  account_ids = [data.aws_caller_identity.current.account_id]
  entity_name = aws_iam_user.user.name
  role_name   = "ThirdPartyBucketRead-${aws_iam_user.user.name}"
  role_tags = merge(var.tags,
    {
      "GitHub_Secret_Name"             = "TEST_ROLE_TO_ASSUME",
      "GitHub_Secret_Terraform_Lookup" = "arn"
    }
  )
  s3_bucket  = var.production_bucket_name
  s3_objects = var.production_objects
}
module "staging_bucket_access" {
  source = "github.com/cisagov/s3-read-role-tf-module"
  providers = {
    aws = aws.images_staging
  }

  account_ids = [data.aws_caller_identity.current.account_id]
  entity_name = aws_iam_user.user.name
  role_name   = "ThirdPartyBucketRead-${aws_iam_user.user.name}"
  role_tags   = var.tags
  s3_bucket   = var.staging_bucket_name
  s3_objects  = var.staging_objects
}
