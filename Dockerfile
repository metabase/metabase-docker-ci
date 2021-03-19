FROM circleci/clojure:lein-2.9.5-node-browsers

MAINTAINER Cam Saul <cam@metabase.com>

# Install Clojure CLI
RUN curl -O https://download.clojure.org/install/linux-install-1.10.3.814.sh && \
        chmod +x linux-install-1.10.1.739.sh && \
        sudo ./linux-install-1.10.1.739.sh

CMD ["/bin/sh"]
