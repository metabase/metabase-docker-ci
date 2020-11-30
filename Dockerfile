FROM circleci/clojure:lein-2.9.3-node-browsers

MAINTAINER Cam Saul <cam@metabase.com>

RUN sudo apt-get update

# Install gettext
RUN sudo apt-get install gettext

# Install Clojure CLI
RUN curl -O https://download.clojure.org/install/linux-install-1.10.1.739.sh && \
        chmod +x linux-install-1.10.1.739.sh && \
        sudo ./linux-install-1.10.1.739.sh

CMD ["/bin/sh"]
