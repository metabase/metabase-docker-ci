FROM circleci/clojure:lein-2.9.6-node

RUN sudo curl -O https://download.clojure.org/install/linux-install-1.10.3.814.sh&& \
    sudo chmod +x linux-install-1.10.3.814.sh && \
    sudo ./linux-install-1.10.3.814.sh

CMD ["/bin/sh"]
