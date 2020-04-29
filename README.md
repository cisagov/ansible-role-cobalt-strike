# ansible-role-cobalt-strike #

[![GitHub Build Status](https://github.com/cisagov/ansible-role-cobalt-strike/workflows/build/badge.svg)](https://github.com/cisagov/ansible-role-cobalt-strike/actions)
[![Total alerts](https://img.shields.io/lgtm/alerts/g/cisagov/ansible-role-cobalt-strike.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/cisagov/ansible-role-cobalt-strike/alerts/)
[![Language grade: Python](https://img.shields.io/lgtm/grade/python/g/cisagov/ansible-role-cobalt-strike.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/cisagov/ansible-role-cobalt-strike/context:python)

An Ansible role for installing [Cobalt
Strike](https://www.cobaltstrike.com/).

## Requirements ##

Requires that a Java implementation be installed.

## Role Variables ##

* `bucket-name` - The name of the AWS S3 bucket where the Cobalt
  Strike tarball and license files are stored.  Defaults to
  `cisa-cool-third-party-production`.
* `tarball_object_name` - The name of the AWS S3 object that is the
  Cobalt Strike tarball.  Defaults to `cobaltstrike.tgz`.
* `license_object_name` - The name of the AWS S3 object that is the
  Cobalt Strike license.  Defaults to `cobaltstrike.license`.

## Dependencies ##

None.

## Example Playbook ##

Here's how to use it in a playbook:

```yaml
- hosts: teamservers
  become: yes
  become_method: sudo
  roles:
    - cobalt_strike
```

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
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

Shane Frasier - <jeremy.frasier@trio.dhs.gov>
