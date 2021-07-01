### DockerHub
[`metabase/ci`](https://hub.docker.com/repository/docker/metabase/ci)

AdoptOpenJDK:alpine + Lein 2.9.6 + Clojure CLI 1.10.3.855

- coreutils:    needed for the basic tools
- ttf-dejavu:   needed for POI
- fontconfig:   needed for POI
- bash:         various shell scripts
- yarn:         frontend building
- nodejs:       frontend building
- git:          ./bin/version
- curl:         needed by script that installs Clojure CLI & Lein
- openssl:      needed to capture SSL certificates during CI setup process

One image per Java version
A normal user with less permissions is created to harden the image with the name of 'circleci' to be able to play with CircleCI images