FROM node:18-alpine3.15

#define workdir
WORKDIR /code

#copy files
COPY --chown=node:node package.json /code/package.json
COPY --chown=node:node package-lock.json /code/package-lock.json
COPY --chown=node:node jest.config.js /code/jest.config.js

#set /code permission and install dependencies
RUN apk add bash && \
    chown node:node -R /code && \
    npm install

#copy content
COPY --chown=node:node . /code

USER node

ENTRYPOINT ["/bin/bash", "-c"]

CMD []