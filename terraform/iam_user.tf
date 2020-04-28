# Create the test user and its access key
resource "aws_iam_user" "user" {
  provider = aws.users

  name = "test-ansible-role-cobalt-strike"
  tags = var.tags
}
resource "aws_iam_access_key" "key" {
  provider = aws.users

  user = aws_iam_user.user.name
}

# Create the role that allows read-only access to the particular S3
# objects that are required by this Ansible role
module "bucket_access" {
  source = "github.com/cisagov/s3-read-role-tf-module"
  providers = {
    aws = aws.images
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
  s3_bucket  = var.bucket_name
  s3_objects = var.objects
}

# Ensure that the test user is allowed to assume the bucket read-only
# role
data "aws_iam_policy_document" "assume_bucket_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    resources = [
      module.bucket_access.role.arn,
    ]
  }
}
resource "aws_iam_user_policy" "assume_bucket_role" {
  provider = aws.users

  policy = data.aws_iam_policy_document.assume_bucket_role.json
  user   = aws_iam_user.user.name
}
