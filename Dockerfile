FROM node:latest
ENV PHANTOM_JS phantomjs-2.1.1-linux-x86_64
ENV APPDIR /usr/src/app
ENV SKIP_SASS_BINARY_DOWNLOAD_FOR_CI 1
USER root
WORKDIR $APPDIR
COPY . $APPDIR
RUN tar xvjf $APPDIR/$PHANTOM_JS.tar.bz2 && mv $APPDIR/$PHANTOM_JS /usr/local/share \
    && ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
RUN npm i --save-dev karma-phantomjs-launcher
RUN npm i --save intl
RUN npm cache verify
RUN npm install
ENTRYPOINT ["npm","run","test"]
