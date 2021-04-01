FROM adoptopenjdk/openjdk11:alpine

ENV FC_LANG en-US LC_CTYPE en_US.UTF-8

# coreutils:    needed for the basic tools
# ttf-dejavu:   needed for POI
# fontconfig:   needed for POI
# bash:         various shell scripts
# yarn:         frontend building
# nodejs:       frontend building
# git:          ./bin/version
# curl:         needed by script that installs Clojure CLI & Lein

RUN apk upgrade && apk add --update-cache --no-cache coreutils ttf-dejavu fontconfig bash yarn nodejs git curl && \
    curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -o /usr/local/bin/lein && \
    chmod +x /usr/local/bin/lein && \
    /usr/local/bin/lein upgrade && \
    curl https://download.clojure.org/install/linux-install-1.10.3.814.sh -o /tmp/linux-install-1.10.3.814.sh && \
    chmod +x /tmp/linux-install-1.10.3.814.sh && \
    sh /tmp/linux-install-1.10.3.814.sh

CMD ["/bin/sh"]
