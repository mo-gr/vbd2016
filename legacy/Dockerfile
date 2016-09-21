FROM node:6-slim

MAINTAINER moritz.grauel@zalando.de

ADD . /opt/legacy

WORKDIR /opt/legacy

RUN npm i

EXPOSE 3000

CMD node index.js