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

variable "production_bucket_name" {
  type        = string
  description = "The name of the S3 bucket where the production Cobalt Strike tarball and license live."
  default     = "cisa-cool-third-party-production"
}

variable "production_objects" {
  type        = list(string)
  description = "The Cobalt Strike tarball and license objects inside the production bucket."
  default = [
    "cobaltstrike_3.tgz",
    "cobaltstrike_4.tgz",
    "cobaltstrike.license"
  ]
}

variable "staging_bucket_name" {
  type        = string
  description = "The name of the S3 bucket where the staging Cobalt Strike tarball and license live."
  default     = "cisa-cool-third-party-staging"
}

variable "staging_objects" {
  type        = list(string)
  description = "The Cobalt Strike tarball and license objects inside the staging bucket."
  default = [
    "cobaltstrike_3.tgz",
    "cobaltstrike_4.tgz",
    "cobaltstrike.license"
  ]
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"

  default = {
    Team        = "VM Fusion - Development"
    Application = "ansible-role-cobalt-strike testing"
  }
}
