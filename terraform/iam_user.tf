# The user being created
resource "aws_iam_user" "user" {
  name = "test-ansible-role-cobalt-strike"
  tags = "${var.tags}"
}

# The IAM access key for the user
resource "aws_iam_access_key" "key" {
  user = "${aws_iam_user.user.name}"
}

# The S3 bucket of interest
data "aws_s3_bucket" "bucket" {
  bucket = "${var.s3_bucket}"
}

# IAM policy documents that allow reading the S3 bucket.  This will be
# applied to the IAM user we are creating.
data "aws_iam_policy_document" "s3_key_doc" {
  count = "${length(var.s3_keys)}"

  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${data.aws_s3_bucket.bucket.arn}/${var.s3_keys[count.index]}",
    ]
  }
}

# The S3 policies for our IAM user that lets the user read the S3
# objects.
resource "aws_iam_user_policy" "s3_policy" {
  count = "${length(var.s3_keys)}"

  user   = "${aws_iam_user.user.id}"
  policy = "${data.aws_iam_policy_document.s3_key_doc.*.json[count.index]}"
}
