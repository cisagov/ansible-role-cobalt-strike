#!/usr/bin/env bash

# Update the Docker images used in the molecule testing for this role.
# Please note that this script requires the yq tool
# (https://github.com/mikefarah/yq) which can be installed from brew as
# yq and is available on Arch as go-yq.

set -o nounset
set -o errexit
set -o pipefail

# Print usage information and exit.
function usage {
  echo "Usage:"
  echo "  ${0##*/} [source_file]"
  echo
  echo "Arguments:"
  echo "  source_file  If specified use this file instead of the default"
  echo "               molecule/default/molecule.yml"
  exit 1
}

# Check for required external programs. If any are missing output a list of all
# requirements and then exit.
function check_dependencies {
  if [ -z "$(command -v yq)" ]; then
    echo "This script requires the following tools to run:"
    echo "- yq"
    exit 1
  fi
}

if [ $# -gt 1 ]; then
  usage
fi

if [ $# -eq 1 ]; then
  source_file="$1"
else
  source_file="molecule/default/molecule.yml"
fi

check_dependencies

yq '.platforms[].image' < "$source_file" | xargs -n 1 docker pull
