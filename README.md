### DockerHub0
[`metabase/ci`](https://hub.docker.com/repository/docker/metabase/ci)
[![](https://images.microbadger.com/badges/version/metabase/ci.svg)](https://microbadger.com/images/metabase/ci)

Docker image with some extra stuff installed for use in Metabase CI.

This is the default CircleCI Lein + Node Docker image with the following extras installed:

- `gettext`
- Clojure CLI

# Building

```bash
tag='metabase/ci:2020-11-30'
docker build -t $tag . && docker push $tag
```
