FROM eclipse-temurin:17-jdk

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV JAVA_HOME=/opt/java/openjdk

# installing Clojure and Clojure CLI
RUN apt-get update && apt-get upgrade -y && apt-get install wget \
    && curl -O https://download.clojure.org/install/linux-install-1.10.3.1040.sh \
    && chmod +x linux-install-1.10.3.1040.sh \
    && ./linux-install-1.10.3.1040.sh \
    # install Node LTS and Yarn from their repos
    && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    # this is a hack to bypass a bug in libssl in Docker for ARM Macs
    && wget https://dl.yarnpkg.com/debian/pubkey.gpg && cat pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install --no-install-recommends -y git nodejs yarn sudo \
    # creating circleci user so nothing falls apart
    && groupadd --gid 3434 circleci \
    && useradd --uid 3434 --gid circleci --shell /bin/bash --create-home circleci \
    && touch /etc/sudoers.d/50-circleci && echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci \
    && echo 'Defaults    env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep \
    && apt-get clean
# switching to circleci user
USER circleci
ENV PATH=/home/circleci/.local/bin:/home/circleci/bin:/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD ["/bin/sh"]