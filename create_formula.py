"""Create a Homebrew Formula for a Numbers Parser."""

import json
import string
import subprocess
import sys

import requests

MAIN_PACKAGE = "numbers-parser"


def dependency_tree(deptree: list) -> list:
    """Extract the packages from pipdeptree JSON."""
    if len(deptree["dependencies"]) == 0:
        return []
    dependencies = [
        (x["package_name"], x["installed_version"]) for x in deptree["dependencies"]
    ]
    for dep in deptree["dependencies"]:
        dependencies += dependency_tree(dep)
    return dependencies


def package_dependencies(package_info: str) -> str:
    """Run pipdeptree to get dependencies."""
    process = subprocess.run(
        ["pipdeptree", "--json-tree", "--packages", MAIN_PACKAGE],
        capture_output=True,
        check=True,
    )
    deptree = json.loads(process.stdout)
    return dependency_tree(deptree[0])


def pypi_package_info(package: str) -> dict:
    """Fetch PyPI JSON for a package."""
    json_url = f"https://pypi.org/pypi/{package}/json"
    try:
        r = requests.get(json_url)  # noqa: S113
        r.raise_for_status()
    except requests.exceptions.HTTPError as e:
        print(str(e), file=sys.stderr)
        sys.exit(1)

    return json.loads(r.content)


def dist_info(
    package_info: str,
    version: str | None = None,
) -> tuple[str, str]:
    """Return the URL and SHA256 hash for a package."""
    if version is None:
        version = package_info["info"]["version"]

    macos_dists = [
        x
        for x in package_info["releases"][version]
        if x["packagetype"] == "bdist_wheel" and "-macosx_" in x["url"]
    ]
    if len(macos_dists) > 1:
        pass
    any_dists = [
        x
        for x in package_info["releases"][version]
        if x["packagetype"] == "bdist_wheel" and "py3-none-any" in x["url"]
    ]
    if len(any_dists):
        return (any_dists[0]["url"], any_dists[0]["digests"]["sha256"])

    if len(macos_dists) == 0:
        print(f"Cannot find wheel for version {version}", file=sys.stderr)
        sys.exit(1)
    url = macos_dists[0]["url"]
    sha256 = macos_dists[0]["digests"]["sha256"]

    return (url, sha256)


def homebrew_resource(package_version: tuple[str, str]) -> str:
    """Create a list of Hobebrew resources."""
    (package, version) = package_version
    package_info = pypi_package_info(package)
    (url, sha256) = dist_info(package_info, version=version)
    return f"""  resource "{package}" do
    url "{url}"
    sha256 "{sha256}"
  end"""


def main() -> None:
    package_info = pypi_package_info(MAIN_PACKAGE)
    version = package_info["info"]["version"]
    dependencies = package_dependencies(package_info)
    (url, sha256) = dist_info(package_info)
    resources = "\n\n".join([homebrew_resource(package) for package in dependencies])

    with open("template.txt") as fh:
        template = fh.read()

    formula = string.Template(template).substitute(
        {
            "url": url,
            "sha256": sha256,
            "version": version,
            "resources": resources,
        }
    )
    with open(f"Formula/{MAIN_PACKAGE}.rb", "w") as fh:
        fh.write(formula)

    print(f"Created formula for version {version}")


if __name__ == "__main__":  # pragma: no cover
    # execute only if run as a script
    main()
