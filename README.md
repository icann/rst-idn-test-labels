# IDN test labels for RST v2.0

This repository contains a set of JSON files representing test data for use in
the [Registry System Testing (RST) v2.0
service](https://www.icann.org/resources/registry-system-testing-v2.0). These
files are used by the RST system to confirm compliance with the [IDN
Guidelines](https://www.icann.org/resources/pages/implementation-guidelines-2012-02-25-en)
by gTLD registries implementing the [Second-Level Reference Label Generation
Rules](https://www.icann.org/resources/pages/second-level-lgr-2015-06-21-en).

During production RSTs, creation and configuration of RST test objects will be
performed by ICANN org. In the [OT&E
environment](https://www.icann.org/resources/registry-system-testing-v2.0/#ote-environment),
test subjects must create their own IDN table objects (via the [RST v2.0 REST
API](https://icann.github.io/rst-api-spec/)). The files in this repository may
be used to do so.

The JSON files conform to the structure of the `idnTableRequest` schema which
is described further in the [RST-API
specification](https://icann.github.io/rst-api-spec/rst-api-spec.html).

## Note on Second-Level Reference LGRs versus "custom" LGRs

The test data in these files was developed to allow testing of gTLD registry
systems that use the Second-Level Reference LGRs published by ICANN.

For production RSTs of registry systems that use "custom" LGRs, ICANN will
create custom test files that will be used instead. Therefore, the files in this
repository are not useful for testing custom LGR implementations.

# License

Copyright 2025, Internet Corporation for Assigned Names and Numbers (ICANN).
