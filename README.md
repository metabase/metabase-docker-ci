### DockerHub
[`metabase/ci`](https://hub.docker.com/repository/docker/metabase/ci)
[![](https://images.microbadger.com/badges/version/metabase/ci.svg)](https://microbadger.com/images/metabase/ci)

Docker image with some extra stuff installed for use in Metabase CI.

This is the default CircleCI Lein + Node (includes Node.js) + browsers (includes Chrome, Firefox, OpenJDK v11, and Geckodriver) Docker image with the following extras installed:

- Clojure CLI

# Building

Should build and push to Dockerhub automatically with each commit
