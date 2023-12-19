terraform {
  # We want to hold off on 1.1 or higher until we have tested it.
  required_version = "~> 1.0"

  # If you use any other providers you should also pin them to the
  # major version currently being used.  This practice will help us
  # avoid unwelcome surprises.
  required_providers {
    # Version 4.9 of the Terraform AWS provider made changes to the S3 bucket
    # refactor that is in place for versions 4.0-4.8 of the provider. With v4.9
    # only non-breaking changes and deprecation notices are introduced. Using
    # this version will simplify migration to the new, broken out AWS S3 bucket
    # configuration resources. Please see
    # https://github.com/hashicorp/terraform-provider-aws/pull/23985
    # for more information about the changes in v4.9 and
    # https://www.hashicorp.com/blog/terraform-aws-provider-4-0-refactors-s3-bucket-resource
    # for more information about the S3 bucket refactor.
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9"
    }
  }
}
