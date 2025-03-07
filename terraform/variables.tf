# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "cobalt_strike_bucket" {
  description = "The name of the S3 bucket where the Cobalt Strike tarball and license live."
  type        = string
}

variable "terraform_state_bucket" {
  description = "The name of the S3 bucket where Terraform state is stored."
  nullable    = false
  type        = string
}

# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region to deploy into (e.g. us-east-1)."
<<<<<<< HEAD
  type        = string
}

variable "cobalt_strike_objects" {
  default = [
    "cobaltstrike.license"
  ]
  description = "The Cobalt Strike license object(s) inside the bucket."
  type        = list(string)
=======
  nullable    = false
  type        = string
>>>>>>> 26819a903c52b39dce7b3673f54402d3d281fba3
}

variable "tags" {
  default = {
    Team        = "VM Fusion - Development"
    Application = "ansible-role-cobalt-strike testing"
  }
  description = "Tags to apply to all AWS resources created"
<<<<<<< HEAD
=======
  nullable    = false
>>>>>>> 26819a903c52b39dce7b3673f54402d3d281fba3
  type        = map(string)
}
