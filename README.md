### DockerHub
[`metabase/ci`](https://hub.docker.com/repository/docker/metabase/ci)

AdoptOpenJDK11:apine + Lein 2.9.5 + Clojure CLI

- coreutils:    needed for the basic tools
- ttf-dejavu:   needed for POI
- fontconfig:   needed for POI
- bash:         various shell scripts
- yarn:         frontend building
- nodejs:       frontend building
- git:          ./bin/version
- curl:         needed by script that installs Clojure CLI & Lein
