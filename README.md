# Build Metadata Concourse Resource

[![Docker Build](https://img.shields.io/docker/cloud/build/mastertinner/build-metadata-resource.svg?style=flat-square)](https://hub.docker.com/r/mastertinner/build-metadata-resource)
![Docker Pulls](https://img.shields.io/docker/pulls/mastertinner/build-metadata-resource.svg?style=flat-square)

Caution: misuse may result in angry concourse developers.

## in: provide metadata as files

[`in`](in) will provide the current build's metadata environment variables as files

## Usage

```yaml
resource_types:
  - name: build-metadata
    type: docker-image
    source:
      repository: mastertinner/build-metadata-resource

resources:
  - name: metadata
    type: build-metadata

jobs:
  - name: my-job
    plan:
      - get: metadata
```
