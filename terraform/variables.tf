variable "aws_region" {
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "tags" {
  type        = "map"
  description = "Tags to apply to all AWS resources created"

  default = {
    Team        = "NCATS OIS - Development"
    Application = "ansible-role-cobalt-strike testing"
  }
}

variable "s3_bucket" {
  type        = "string"
  description = "The name of the AWS S3 bucket that the IAM user needs to be able to read."
  default     = "cobalt-strike-for-pca-teamservers"
}

variable "s3_keys" {
  type        = "list"
  description = "The AWS S3 keys that the IAM user needs to be able to read."
  default     = ["cobaltstrike.tgz", "cobaltstrike.license"]
}
