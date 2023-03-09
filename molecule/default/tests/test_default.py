"""Module containing the tests for the default scenario."""

# Standard Python Libraries
import os
import re

# Third-Party Libraries
import pytest
import semver
from strip_ansi import strip_ansi
import testinfra.utils.ansible_runner

min_expected_version = semver.VersionInfo.parse("4.7.2")
expected_licensed_value = "Licensed"

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ["MOLECULE_INVENTORY_FILE"]
).get_hosts("all")


@pytest.mark.parametrize(
    "f",
    [
        "/opt/cobaltstrike",
        "/opt/cobaltstrike/cobaltstrike.auth",
        "/opt/cobaltstrike/update",
    ],
)
def test_files(host, f):
    """Test that the expected files and directories are present."""
    assert host.file(f).exists


@pytest.mark.parametrize("f", ["/tmp/cobaltstrike.tgz"])
def test_files2(host, f):
    """Test that the expected files and directories were deleted."""
    assert not host.file(f).exists


def test_version_and_license(host):
    """Verify that Cobalt Strike is licensed and is an expected version."""
    cmd = host.run("cd /opt/cobaltstrike && ./teamserver")
    regex = r"^\[\*\] Team Server Version: (?P<version>(\d+\.)?\d+) (?P<licensed>.*)$"
    # Note that re.MULTILINE is critical here, since the output of the
    # command spans several lines
    match = re.search(regex, strip_ansi(cmd.stdout), re.MULTILINE)
    assert match is not None, "Regex does not match Cobalt Strike output."

    version = match.group("version")
    try:
        actual_version = semver.VersionInfo.parse(version)
    except ValueError:
        # CobaltStrike sometimes breaks semver by not including the
        # patch version when it should be zero.
        try:
            actual_version = semver.VersionInfo.parse(f"{version}.0")
        except ValueError:
            assert (
                False
            ), f"Unable to parse {version} or {version}.0 as a valid semantic version."
    assert (
        actual_version >= min_expected_version
    ), f"Cobalt Strike version is expected to be greater than or equal to {min_expected_version}."

    licensed = match.group("licensed")
    assert licensed == expected_licensed_value, "Cobalt Strike is not licensed."
