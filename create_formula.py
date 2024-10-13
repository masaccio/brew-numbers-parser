import string
import requests
import json
import sys

json_url = "https://pypi.org/pypi/numbers-parser/json"
try:
    r = requests.get(json_url)
    r.raise_for_status()
except requests.exceptions.HTTPError as e:
    print(str(e), file=sys.stderr)
    sys.exit(1)

package_info = json.loads(r.content)
version = package_info["info"]["version"]
url = None
for dist in package_info["releases"][version]:
    if dist["packagetype"] == "sdist":
        url = dist["url"]
        sha256 = dist["digests"]["sha256"]
if url is None:
    print(f"Cannot find source dist for version {version}", file=sys.stderr)
    sys.exit(1)

with open("template.txt") as fh:
    template = fh.read()

formula = string.Template(template).substitute(
    {
        "url": url,
        "sha256": sha256,
        "version": version,
    }
)
with open("Formula/numbers-parser.rb", "w") as fh:
    fh.write(formula)

print(f"Created formula for version {version}")
