# skeleton-ansible-role #

[![Build Status](https://travis-ci.com/cisagov/skeleton-ansible-role.svg?branch=develop)](https://travis-ci.com/cisagov/skeleton-ansible-role)
[![Total alerts](https://img.shields.io/lgtm/alerts/g/cisagov/skeleton-ansible-role.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/cisagov/skeleton-ansible-role/alerts/)
[![Language grade: Python](https://img.shields.io/lgtm/grade/python/g/cisagov/skeleton-ansible-role.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/cisagov/skeleton-ansible-role/context:python)

This is a skeleton project that can be used to quickly get a new
[cisagov](https://github.com/cisagov) Ansible role GitHub project
started.  This skeleton project contains [licensing
information](LICENSE.md), as well as [pre-commit
hooks](https://pre-commit.com) and a [Travis
CI](https://travis-ci.com) configuration appropriate for an Ansible
role.

## Requirements ##

None.

## Role Variables ##

None.

## Dependencies ##

None.

## Example Playbook ##

Here's how to use it in a playbook:

```yaml
- hosts: all
  become: yes
  become_method: sudo
  roles:
    - skeleton
```

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE.md).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.

## Author Information ##

First Last - <first.last@trio.dhs.gov>
