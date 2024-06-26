FROM node:iron-alpine as base

RUN apk --no-cache add git python3 make gcc musl-dev g++ bash
WORKDIR /app/genesis
COPY genesis/package*.json ./
RUN npm ci

FROM node:iron-alpine as release

COPY --from=base --chown=node:node /app/genesis /app/genesis
WORKDIR /app/genesis
COPY --chown=node:node genesis/ .

## Add the wait script to the image
ADD --chown=node:node https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait
RUN chmod +x /wait

WORKDIR /app/genesis/src/notifications

USER node
CMD /wait && node Worker.js
