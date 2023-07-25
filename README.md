# skeleton-ansible-role #

[![GitHub Build Status](https://github.com/cisagov/skeleton-ansible-role/workflows/build/badge.svg)](https://github.com/cisagov/skeleton-ansible-role/actions)
[![CodeQL](https://github.com/cisagov/skeleton-ansible-role/workflows/CodeQL/badge.svg)](https://github.com/cisagov/skeleton-ansible-role/actions/workflows/codeql-analysis.yml)

This is a skeleton project that can be used to quickly get a new
[cisagov](https://github.com/cisagov) Ansible role GitHub project
started.  This skeleton project contains
[licensing information](LICENSE), as well as
[pre-commit hooks](https://pre-commit.com) and
[GitHub Actions](https://github.com/features/actions) configurations
appropriate for an Ansible role.

## Requirements ##

None.

## Role Variables ##

None.

<!--
| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| optional_variable | Describe its purpose. | `default_value` | No |
| required_variable | Describe its purpose. | n/a | Yes |
-->

## Dependencies ##

None.

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
