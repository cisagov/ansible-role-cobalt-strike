variable "aws_region" {
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"

  default = {
    Team        = "NCATS OIS - Development"
    Application = "ansible-role-cobalt-strike testing"
  }
}

variable "bucket_name" {
  type        = string
  description = "The name of the AWS S3 bucket from which the IAM user needs to be able to read."
  default     = "cobalt-strike-for-pca-teamservers"
}
