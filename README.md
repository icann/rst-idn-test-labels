# IDN test labels for RST v2.0

> [!NOTE]
> *The current release is
> [v1.0.3](https://github.com/icann/rst-idn-test-labels/releases/tag/v1.0.3).*

> [!WARNING]
> *Looking for JSON files? They are now available from the
> [releases page](https://github.com/icann/rst-idn-test-labels/releases).*

This repository generates JSON files representing test data for use in
the [Registry System Testing (RST) v2.0
service](https://www.icann.org/resources/registry-system-testing-v2.0). These
files are used by the RST system to confirm compliance with the [IDN
Guidelines](https://www.icann.org/resources/pages/implementation-guidelines-2012-02-25-en)
by gTLD registries implementing the [Second-Level Reference Label Generation
Rules](https://www.icann.org/resources/pages/second-level-lgr-2015-06-21-en).

During production tests, creation and configuration of RST test objects (and
any associated IDN table objects) will be performed by ICANN org. In the [OT&E
environment](https://www.icann.org/resources/registry-system-testing-v2.0/#ote-environment),
test subjects must create their own IDN table objects (via the [RST v2.0 REST
API](https://icann.github.io/rst-api-spec/)) which can then be associated with
their tests. The files in this repository may be used to do so.

The JSON files published on the the [releases
page](https://github.com/icann/rst-idn-test-labels/releases) conform
to the structure of the `idnTableRequest` schema which is described further in
the [RST-API
specification](https://icann.github.io/rst-api-spec/rst-api-spec.html).

Therefore, a new IDN table object can be created in the API using `curl` as
follows:

```
curl \
    --cert path_to_key_and_cert.pem \
    --header "content-type: application/json" \
    --data-binary "@table.json" \
    https://rst-api-ote.icann.org/v1/table
```

Replace `table.json` with the appropriate file name for the table you want
to create.

## Note on Second-Level Reference LGRs versus "custom" LGRs

The test data in these files was developed to allow testing of gTLD registry
systems that use the Second-Level Reference LGRs.

For production tests of registry systems that use "custom" LGRs, ICANN will
create custom test files that will be used instead. Therefore, the files in this
repository are not useful for testing custom LGR implementations.

Once custom table objects have been created by ICANN, test subjects are free to
use them in the OT&E environment for testing in that environment.

# Releasing a new version

1. The [YAML files](yaml/) are maintained by the IDN Team (YAML is used as the
   source format as it is a superset of JSON but (a) is easier to edit and (b)
   supports comments).
2. When a new set of files are provided, commit the files, and tag the
   repository with a tag of the form `vN.N.N`, following [Semantic
   Versioning](https://semver.org).
2. Push the tag to GitHub using `git push --tags`.
3. Create a new
   [release](https://github.com/icann/rst-idn-test-labels/releases/new) using
   the tag. The [release workflow](.github/workflows/release.yaml) will generate
   JSON versions and publish them as release assets.
4. Update the note at the top of this file.

Since the [RST test specs](https://github.com/icann/rst-test-specs) includes a
[resource](https://icann.github.io/rst-test-specs/rst-test-specs.html#Resource-idn.testLabelsForOTE)
that links to the test labels, every time a new version of the test labels is
released, a [new version of the test
specs](https://github.com/icann/rst-test-specs?tab=readme-ov-file#releasing-a-new-version)
should also be released, in order to incorporate the new URL.

## See Also

* [RST Test Specifications](https://icann.github.io/rst-test-specs/)
  ([GitHub repository](https://github.com/icann/rst-test-specs))
* [RST API Specification](https://icann.github.io/rst-api-spec)
  ([GitHub repository](https://github.com/icann/rst-api-spec))

# License

Copyright 2025, Internet Corporation for Assigned Names and Numbers (ICANN).

The files in this repository are published under the "Creative Commons
Attribution 4.0 International" license. See [LICENSE](LICENSE) for more details.
