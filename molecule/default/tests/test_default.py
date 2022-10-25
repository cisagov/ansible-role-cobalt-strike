"""Module containing the tests for the default scenario."""

# Standard Python Libraries
import datetime
import os
import re

# Third-Party Libraries
import pytest
import semver
from strip_ansi import strip_ansi
import testinfra.utils.ansible_runner

min_expected_version = semver.VersionInfo.parse("4.7.2")
min_expected_release_date = datetime.date(2022, 10, 17)
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
    regex = r"^\[\*\] Team Server Version: (?P<version>\d+\.\d+\.\d+) \((?P<year>\d{4})(?P<month>\d{2})(?P<day>\d{2})\) (?P<licensed>.*)$"
    # Note that re.MULTILINE is critical here, since the output of the
    # command spans several lines
    print(repr(strip_ansi(cmd.stdout)))
    match = re.search(regex, strip_ansi(cmd.stdout), re.MULTILINE)
    assert match is not None, "Regex does not match Cobalt Strike output."

    version = match.group("version")
    assert (
        semver.VersionInfo.parse(version) >= min_expected_version
    ), f"Cobalt Strike version is expected to be greater than or equal to {min_expected_version}."

    year = int(match.group("year"))
    month = int(match.group("month"))
    day = int(match.group("day"))
    assert (
        datetime.date(year, month, day) >= min_expected_release_date
    ), f"Cobalt Strike release date is expected to be no earlier than {min_expected_release_date}."

    licensed = match.group("licensed")
    assert licensed == expected_licensed_value, "Cobalt Strike is not licensed."
