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

# Ensure that the test user is allowed to assume the bucket read-only
# roles
data "aws_iam_policy_document" "assume_bucket_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    resources = [
      module.production_bucket_access.role.arn,
      module.staging_bucket_access.role.arn,
    ]
  }
}
resource "aws_iam_user_policy" "assume_bucket_role" {
  provider = aws.users

  policy = data.aws_iam_policy_document.assume_bucket_role.json
  user   = aws_iam_user.user.name
}
