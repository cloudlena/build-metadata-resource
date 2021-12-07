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

## Full Example

```yaml
---
resource_types:
  - name: build-metadata
    type: docker-image
    source:
      repository: mastertinner/build-metadata-resource

resources:

  - name: metadata
    type: build-metadata

  - name: resource-tutorial
    type: git
    source:
      uri: https://github.com/starkandwayne/concourse-tutorial.git
      branch: develop

jobs:
  - name: access-build-details
    public: true
    plan:
      - get: resource-tutorial
        trigger: true
     
      - get: metadata
     
      - task: task-print-build-details
        config:
          platform: linux
          image_resource:
            type: docker-image
            source: {repository: busybox}
          inputs:
            - name: resource-tutorial
            - name: metadata
          run:
                path: "/bin/sh"
                args:
                - "-c"
                - >
                    ls ./metadata
                    
                    BUILD_ID=`cat ./metadata/build-id`
                    
                    echo $BUILD_ID

                    echo "You can access the other build details in similar way"


```
