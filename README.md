# skeleton-ansible-role-with-test-user #

[![GitHub Build Status](https://github.com/cisagov/skeleton-ansible-role-with-test-user/workflows/build/badge.svg)](https://github.com/cisagov/skeleton-ansible-role-with-test-user/actions)
[![License](https://img.shields.io/github/license/cisagov/skeleton-ansible-role-with-test-user)](https://spdx.org/licenses/)
[![CodeQL](https://github.com/cisagov/skeleton-ansible-role-with-test-user/workflows/CodeQL/badge.svg)](https://github.com/cisagov/skeleton-ansible-role-with-test-user/actions/workflows/codeql-analysis.yml)

This is a skeleton project that can be used to quickly get a new
[cisagov](https://github.com/cisagov) Ansible role GitHub project
started, where that Ansible role requires an AWS test user for
automated testing.

This skeleton project contains [licensing information](LICENSE), as
well as [pre-commit hooks](https://pre-commit.com) and [GitHub
Actions](https://github.com/features/actions) configurations
appropriate for an Ansible role, as well as the Terraform code to
create the AWS test user.

## Pre-requisites ##

In order to execute the Molecule tests for this Ansible role in GitHub Actions,
a test user must exist in AWS. The accompanying Terraform code will create the
user with the appropriate name and permissions. This only needs to be run once
per project, per AWS account. This user can also be used to run the Molecule
tests on your local machine.

Before the test user can be created, you will need a profile in your AWS
credentials file that allows you to read and write your remote Terraform state.
(You almost certainly do not want to use local Terraform state for this
long-lived test user.)  If the test user is to be created in the CISA COOL
environment, for example, then you will need the `cool-terraform-backend`
profile.

The easiest way to set up the Terraform remote state profile is to make use of
our [`aws-profile-sync`](https://github.com/cisagov/aws-profile-sync) utility.
Follow the usage instructions in that repository before continuing with the next
steps, and note that you will need to know where your team stores their remote
profile data in order to use
[`aws-profile-sync`](https://github.com/cisagov/aws-profile-sync).

### Creating a test user ###

You will need to create a test user for each environment that you use.  The
following steps show how to create a test user for an environment named "dev".
You will need to repeat this process for any additional environments.

1. Change into the `terraform` directory:

   ```console
   cd terraform
   ```

1. Create a backend configuration file named `dev.tfconfig` containing the
name of the bucket where "dev" environment Terraform state is stored - this file
is required to initialize the Terraform backend in each environment:

    ```hcl
    bucket = "my-dev-terraform-state-bucket"
    ```

1. Initialize the Terraform backend for the "dev" environment using your backend
   configuration file:

    ```console
    terraform init -backend-config=dev.tfconfig
    ```

    > [!NOTE]
    > When performing this step for additional environments (i.e. not your first
    > environment), use the `-reconfigure` flag:
    >
    > ```console
    > terraform init -backend-config=other-env.tfconfig -reconfigure
    > ```

1. Create a Terraform variables file named `dev.tfvars` containing all
required variables (currently only `terraform_state_bucket`):

    ```hcl
    terraform_state_bucket = "my-dev-terraform-state-bucket"
    ```

1. Create a Terraform workspace for the "dev" environment:

    ```console
   terraform workspace new dev
   ```

1. Initialize and upgrade the Terraform workspace, then apply the configuration
   to create the test user in the "dev" environment:

    ```console
    terraform init -upgrade=true
    terraform apply -var-file=dev.tfvars
    ```

Once the test user is created you will need to update the
[repository's secrets](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets)
with the new encrypted environment variables. This should be done using the
[`terraform-to-secrets`](https://github.com/cisagov/development-guide/tree/develop/project_setup#terraform-iam-credentials-to-github-secrets-)
tool available in the
[development guide](https://github.com/cisagov/development-guide). Instructions
for how to use this tool can be found in the
["Terraform IAM Credentials to GitHub Secrets" section](https://github.com/cisagov/development-guide/tree/develop/project_setup#terraform-iam-credentials-to-github-secrets-).
of the Project Setup README.

If you have appropriate permissions for the repository you can view existing
secrets on the
[appropriate page](https://github.com/cisagov/skeleton-ansible-role-with-test-user/settings/secrets)
in the repository's settings.

## Requirements ##

None.

## Role Variables ##

None.

<!-- markdownlint-disable line-length -->
<!--
| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| skeleton_with_test_user_bucket_name | The name of the AWS S3 bucket where the third-party files are stored. | None | Yes |
| skeleton_with_test_user_license_object_name | The name of the AWS S3 object that is the third-party license. | `closed_source_tool.license` | No |
-->
<!-- markdownlint-enable line-length -->

## Dependencies ##

None.

## Installation ##

This role can be installed via the command:

```console
ansible-galaxy install --role-file path/to/requirements.yml
```

where `requirements.yml` looks like:

```yaml
---
- name: skeleton
  src: https://github.com/cisagov/skeleton-ansible-role-with-test-user
```

and may contain other roles as well.

For more information about installing Ansible roles via a YAML file,
please see [the `ansible-galaxy`
documentation](https://docs.ansible.com/ansible/latest/galaxy/user_guide.html#installing-multiple-roles-from-a-file).

## Example Playbook ##

Here's how to use it in a playbook:

```yaml
- hosts: all
  become: true
  become_method: sudo
  tasks:
    - name: Include skeleton
      ansible.builtin.include_role:
        name: skeleton
```

## New Repositories from a Skeleton ##

Please see our [Project Setup guide](https://github.com/cisagov/development-guide/tree/develop/project_setup)
for step-by-step instructions on how to start a new repository from
a skeleton. This will save you time and effort when configuring a
new repository!

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.

## Author Information ##

First Last - <first.last@gwe.cisa.dhs.gov>
