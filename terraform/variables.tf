# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket where the Cobalt Strike tarball and license live."
  default     = "cisa-cool-third-party-production"
}

variable "objects" {
  type        = list(string)
  description = "The Cobalt Strike tarball and license objects inside the bucket."
  default     = ["cobaltstrike.tgz", "cobaltstrike.license"]
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"

  default = {
    Team        = "NCATS OIS - Development"
    Application = "ansible-role-cobalt-strike testing"
  }
}
