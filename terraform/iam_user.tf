# The user being created
resource "aws_iam_user" "user" {
  name = "test-ansible-role-cobalt-strike"
  tags = var.tags
}

# The IAM access key for the user
resource "aws_iam_access_key" "key" {
  user = aws_iam_user.user.name
}

# The S3 bucket of interest
data "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

# IAM policy document that allows reading from a specific S3 bucket.
# This will be applied to the IAM user we are creating.
data "aws_iam_policy_document" "s3_doc" {
  statement {
    effect = "Allow"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      data.aws_s3_bucket.bucket.arn,
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${data.aws_s3_bucket.bucket.arn}/*",
    ]
  }
}

# The S3 policy for our IAM user that lets the user read from a
# particular bucket.
resource "aws_iam_user_policy" "s3_policy" {
  user   = aws_iam_user.user.id
  policy = data.aws_iam_policy_document.s3_doc.json
}
