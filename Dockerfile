FROM alpine:latest

RUN apk -q update

RUN apk -q add gcc make musl-dev perl-dev perl-app-cpanminus \
  perl-lwp-protocol-https perl-json-xs perl-xml-libxml perl-yaml-xs \
  perl-file-slurp perl-text-csv_xs perl-module-build perl-module-build-tiny \
  perl-mojolicious perl-moo perl-strictures perl-autovivification \
  perl-ref-util perl-namespace-clean perl-safe-isa perl-path-tiny \
  perl-file-sharedir perl-type-tiny zip

RUN cpanm -qn Data::Mirror JSON::Schema::Modern
