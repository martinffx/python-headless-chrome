FROM python:3.6-slim

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y wget libxml2-dev libxslt-dev unzip libxss1 \
    libappindicator1 libindicator7 gconf-service libasound2 libgconf-2-4 \
    libgtk-3-0 libnspr4 libx11-xcb1 libxtst6 libnss3 fonts-liberation \
    lsb-release xdg-utils

# Install dockerize
ENV DOCKERIZE_VERSION v0.5.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# Install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && dpkg -i google-chrome*.deb
    # && rm -rf google-chrome*.deb

# Install Selenium Chrome driver
ENV CHROME_DRIVER 2.33
RUN wget https://chromedriver.storage.googleapis.com/$CHROME_DRIVER/chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip &&  mv chromedriver /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver && rm -rf chromedriver*
