FROM circleci/clojure:lein-2.8.1-node-browsers

MAINTAINER Cam Saul <cam@metabase.com>

RUN sudo apt-get install build-essential

RUN sudo npm install -g 'yarn@>=0.16.0'
RUN sudo chmod 755 /usr/local/bin/yarn

CMD ["/bin/sh"]
