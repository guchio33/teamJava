FROM node:16-alpine

RUN mkdir /app
WORKDIR /app

RUN apk update && \
    apk upgrade && \
    apk add git && \
    npm install -g npm@latest nuxi nuxt3