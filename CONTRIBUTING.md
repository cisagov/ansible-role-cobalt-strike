# Welcome #

We're so glad you're thinking about contributing to this open source
project!  If you're unsure or afraid of anything, just ask or submit
the issue or pull request anyway.  The worst that can happen is that
you'll be politely asked to change something.  We appreciate any sort
of contribution, and don't want a wall of rules to get in the way of
that.

Before contributing, we encourage you to read our CONTRIBUTING policy
(you are here), our [LICENSE](LICENSE), and our [README](README.md),
all of which should be in this repository.

## Issues ##

If you want to report a bug or request a new feature, the most direct
method is to [create an
issue](https://github.com/cisagov/ansible-role-cobalt-strike/issues)
in this repository.  We recommend that you first search through
existing issues (both open and closed) to check if your particular
issue has already been reported.  If it has then you might want to add
a comment to the existing issue.  If it hasn't then feel free to
create a new one.

## Pull requests ##

If you choose to [submit a pull
request](https://github.com/cisagov/ansible-role-cobalt-strike/pulls),
you will notice that our continuous integration (CI) system runs a
fairly extensive set of linters and syntax checkers.  Your pull
request may fail these checks, and that's OK.  If you want you can
stop there and wait for us to make the necessary corrections to ensure
your code passes the CI checks.

If you want to make the changes yourself, or if you want to become a
regular contributor, then you will want to set up
[pre-commit](https://pre-commit.com/) on your local machine.  Once you
do that, the CI checks will run locally before you even write your
commit message.  This speeds up your development cycle considerably.

### Setting up pre-commit ###

There are a few ways to do this, but we prefer to use
[`pyenv`](https://github.com/pyenv/pyenv) and
[`pyenv-virtualenv`](https://github.com/pyenv/pyenv-virtualenv) to
create and manage a Python virtual environment specific to this
project.

If you already have `pyenv` and `pyenv-virtualenv` configured you can
take advantage of the `setup-env` tool in this repo to automate the
entire environment configuration process.

```console
./setup-env
```

Otherwise, follow the steps below to manually configure your
environment.

#### Installing and using `pyenv` and `pyenv-virtualenv` ####

On the Mac, we recommend installing [brew](https://brew.sh/).  Then
installation is as simple as `brew install pyenv pyenv-virtualenv` and
adding this to your profile:

```bash
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

For Linux, Windows Subsystem for Linux (WSL), or on the Mac (if you
don't want to use `brew`) you can use
[pyenv/pyenv-installer](https://github.com/pyenv/pyenv-installer) to
install the necessary tools. Before running this ensure that you have
installed the prerequisites for your platform according to the
[`pyenv` wiki
page](https://github.com/pyenv/pyenv/wiki/common-build-problems).

On WSL you should treat your platform as whatever Linux distribution
you've chosen to install.

Once you have installed `pyenv` you will need to add the following
lines to your `.bash_profile` (or `.profile`):

```bash
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
```

and then add the following lines to your `.bashrc`:

```bash
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

If you want more information about setting up `pyenv` once installed, please run

```console
pyenv init
```

and

```console
pyenv virtualenv-init
```

for the current configuration instructions.

If you are using a shell other than `bash` you should follow the
instructions that the `pyenv-installer` script outputs.

You will need to reload your shell for these changes to take effect so
you can begin to use `pyenv`.

For a list of Python versions that are already installed and ready to
use with `pyenv`, use the command `pyenv versions`.  To see a list of
the Python versions available to be installed and used with `pyenv`
use the command `pyenv install --list`.  You can read more
[here](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md) about
the many things that `pyenv` can do.  See
[here](https://github.com/pyenv/pyenv-virtualenv#usage) for the
additional capabilities that pyenv-virtualenv adds to the `pyenv`
command.

#### Creating the Python virtual environment ####

Once `pyenv` and `pyenv-virtualenv` are installed on your system, you
can create and configure the Python virtual environment with these
commands:

```console
cd ansible-role-cobalt-strike
pyenv virtualenv <python_version_to_use> ansible-role-cobalt-strike
pyenv local ansible-role-cobalt-strike
pip install --requirement requirements-dev.txt
```

#### Installing the pre-commit hook ####

Now setting up pre-commit is as simple as:

```console
pre-commit install
```

At this point the pre-commit checks will run against any files that
you attempt to commit.  If you want to run the checks against the
entire repo, just execute `pre-commit run --all-files`.

## Public domain ##

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
