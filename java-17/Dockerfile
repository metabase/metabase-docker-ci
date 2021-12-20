FROM eclipse-temurin:17-jdk-focal

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV JAVA_HOME=/opt/java/openjdk

# installing Clojure and Clojure CLI
RUN curl -O https://download.clojure.org/install/linux-install-1.10.3.1040.sh && \
    chmod +x linux-install-1.10.3.1040.sh && \
    ./linux-install-1.10.3.1040.sh && \
    # install Node LTS and Yarn from their repos
    curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get upgrade -y && apt-get install --no-install-recommends -y git nodejs yarn unzip \
    # now installing Cypress dependencies according to https://docs.cypress.io/guides/getting-started/installing-cypress#System-requirements
    && apt-get install --no-install-recommends -y sudo netcat jq wget libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb \
    # creating circleci user so nothing falls apart
    && groupadd --gid 3434 circleci   && useradd --uid 3434 --gid circleci --shell /bin/bash --create-home circleci \
    && touch /etc/sudoers.d/50-circleci && echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci   && echo 'Defaults    env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep
# switching to circleci user
USER circleci
ENV PATH=/home/circleci/.local/bin:/home/circleci/bin:/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# firefox install
RUN FIREFOX_URL="https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" \
    && ACTUAL_URL=$(curl -Ls -o /dev/null -w %{url_effective} $FIREFOX_URL) \
    && curl --silent --show-error --location --fail --retry 3 --output /tmp/firefox.tar.bz2 $ACTUAL_URL \
    && sudo tar -xvjf /tmp/firefox.tar.bz2 -C /opt   && sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox \
    && sudo apt-get install -y libgtk3.0-cil-dev libdbus-glib-1-2 libdbus-1-3 \
    && rm -rf /tmp/firefox.* && firefox --version \
    && export GECKODRIVER_LATEST_RELEASE_URL=$(curl https://api.github.com/repos/mozilla/geckodriver/releases/latest | jq -r ".assets[] | select(.name | test(\"linux64.tar.gz$\")) | .browser_download_url") \
    && curl --silent --show-error --location --fail --retry 3 --output /tmp/geckodriver_linux64.tar.gz "$GECKODRIVER_LATEST_RELEASE_URL" \
    && cd /tmp && tar xf geckodriver_linux64.tar.gz && rm -rf geckodriver_linux64.tar.gz && sudo mv geckodriver /usr/local/bin/geckodriver \
    && sudo chmod +x /usr/local/bin/geckodriver && geckodriver --version \
    # chrome install
    && cd /home/circleci && wget -O google-chrome-stable_current_amd64.deb -t 5 "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" \
    && (sudo dpkg -i google-chrome-stable_current_amd64.deb || sudo apt-get -fy install) \
    && rm -rf google-chrome-stable_current_amd64.deb \
    && sudo sed -i 's|HERE/chrome"|HERE/chrome" --disable-setuid-sandbox --no-sandbox|g' "/opt/google/chrome/google-chrome" \
    && google-chrome --version \
    && CHROME_VERSION="$(google-chrome --version)" \
    && export CHROMEDRIVER_RELEASE="$(echo $CHROME_VERSION | sed 's/^Google Chrome //')" && export CHROMEDRIVER_RELEASE=${CHROMEDRIVER_RELEASE%%.*} \
    && CHROMEDRIVER_VERSION=$(curl --silent --show-error --location --fail --retry 4 --retry-delay 5 http://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROMEDRIVER_RELEASE}) \
    && curl --silent --show-error --location --fail --retry 4 --retry-delay 5 --output /tmp/chromedriver_linux64.zip "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" \
    && cd /tmp && unzip chromedriver_linux64.zip \ 
    && rm -rf chromedriver_linux64.zip \
    && sudo mv chromedriver /usr/local/bin/chromedriver \
    && sudo chmod +x /usr/local/bin/chromedriver && chromedriver --version \
    # to finish, do some cleanup
    && sudo apt-get clean

CMD ["/bin/sh"]