FROM circleci/clojure:openjdk-8-buster-node-browsers

RUN sudo apt update && sudo apt upgrade -y && \
    sudo curl -O https://download.clojure.org/install/linux-install-1.10.3.929.sh && \
    sudo chmod +x linux-install-1.10.3.929.sh && \
    sudo ./linux-install-1.10.3.929.sh

CMD ["/bin/sh"]
