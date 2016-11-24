# Build Metadata Concourse Resource

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
