# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "cobalt_strike_bucket" {
  type        = string
  description = "The name of the S3 bucket where the Cobalt Strike tarball and license live."
}

variable "terraform_state_bucket" {
  description = "The name of the S3 bucket where Terraform state is stored."
  type        = string
}

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

variable "cobalt_strike_objects" {
  type        = list(string)
  description = "The Cobalt Strike license object(s) inside the bucket."
  default = [
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
