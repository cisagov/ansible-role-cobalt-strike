# Test User #

This directory consists of [Terraform](https://www.terraform.io/) code
that is used to create a test user.  This test user is in turn used by
our CI/CD pipeline to test the Ansible role.

See the [overall project documentation](../README.md) for a detailed
description of how this code is intended to be used.

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
| ---- | ------- |
| terraform | ~> 1.1 |
| aws | ~> 6.7 |

## Providers ##

| Name | Version |
| ---- | ------- |
| aws | ~> 6.7 |
| terraform | n/a |

## Modules ##

| Name | Source | Version |
| ---- | ------ | ------- |
| user | github.com/cisagov/molecule-iam-user-tf-module | n/a |

## Resources ##

| Name | Type |
| ---- | ---- |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [terraform_remote_state.images](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.images_ssm](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.users](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| aws\_region | The AWS region to deploy into (e.g. us-east-1). | `string` | `"us-east-1"` | no |
| tags | Tags to apply to all AWS resources created | `map(string)` | ```{ "Application": "skeleton-ansible-role-with-test-user testing", "Team": "VM Fusion - Development" }``` | no |
| terraform\_state\_bucket | The name of the S3 bucket where Terraform state is stored. | `string` | n/a | yes |

## Outputs ##

| Name | Description |
| ---- | ----------- |
| access\_key | The IAM access key associated with the CI IAM user created by this module. |
| role | The IAM role that the CI user can assume to read SSM parameters in the Images account. |
| user | The CI IAM user created by this module. |
<!-- END_TF_DOCS -->
