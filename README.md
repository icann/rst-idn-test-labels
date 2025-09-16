# IDN test labels for RST v2.0

> [!NOTE]
> *The current release is [v1.0.3](https://github.com/icann/rst-idn-test-labels/releases/tag/v1.0.3).*

> [!WARNING]
> *Looking for JSON files? They have been moved to the [releases](https://github.com/icann/rst-idn-test-labels/releases) page.*

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

The [JSON files](./json) conform to the structure of the `idnTableRequest`
schema which is described further in the [RST-API
specification](https://icann.github.io/rst-api-spec/rst-api-spec.html).

Therefore, a new IDN table object can be created in the API using `curl` as
follows:

```
curl \
    --cert path_to_key_and_cert.pem \
    --header "content-type: application/json" \
    --data-binary "@json/table.json" \
    https://rst-api-ote.icann.org/v1/table
```

Replace `json/table.json` with the appropriate file name for the table you want
to create.

## Note on Second-Level Reference LGRs versus "custom" LGRs

The test data in these files was developed to allow testing of gTLD registry
systems that use the Second-Level Reference LGRs published by ICANN.

For production tests of registry systems that use "custom" LGRs, ICANN will
create custom test files that will be used instead. Therefore, the files in this
repository are not useful for testing custom LGR implementations.

Once created, test subjects are free to copy IDN table objects created by
ICANN for custom IDN tables into the OT&E system for testing in that
environment.

# Releasing a new version

1. The YAML files are provided by the IDN Team. When a new set of files are
   provided, specify their location by creating a `.env` file in the
   repository's root directory:

   ```
   SRC_DIR="/path/to/yaml/files"
   ```
2. Run `make`. This will validate the YAML files, copy them to the `yaml/`
   directory, and write the JSON versions to the `json/` directory.
3. Commit the files, and tag them with a tag of the form `vN.N.N`, following
   [Semantic Versioning](https://semver.org).
4. Push the tag to GitHub using `git push --tags`.
5. Create a new
   [release](https://github.com/icann/rst-idn-test-labels/releases/new) using
   the tag.
6. Update the note at the top of this file.

Since the [RST test specs](https://github.com/icann/rst-test-specs) includes a
[resource](https://icann.github.io/rst-test-specs/rst-test-specs.html#Resource-idn.testLabelsForOTE)
that links to the test labels, every time a new version of the test labels is
released, a [new version of the test
specs](https://github.com/icann/rst-test-specs?tab=readme-ov-file#releasing-a-new-version)
must also be released, in order to incorporate the new URL.

## See Also

* [RST Test Specifications](https://icann.github.io/rst-test-specs/)
  ([GitHub repository](https://github.com/icann/rst-test-specs))
* [RST API Specification](https://icann.github.io/rst-api-spec)
  ([GitHub repository](https://github.com/icann/rst-api-spec))

# License

Copyright 2025, Internet Corporation for Assigned Names and Numbers (ICANN).

The files in this repository are published under the "Creative Commons
Attribution 4.0 International" license. See [LICENSE](LICENSE) for more details.
