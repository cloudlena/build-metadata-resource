# Build Metadata Concourse Resource

Caution: misuse may result in angry concourse developers.

## out: emit build number as version

[`out`](out) just reports the build number, so that [`in`](in) can run.

## in: dump metadata to files

[`in`](in) will dump the current build's metadata.

## Usage

```yaml
- name: build-metadata
  type: docker-image
  source:
    repository: mastertinner/build-metadata-resource

- name: metadata
  type: build-metadata
```
