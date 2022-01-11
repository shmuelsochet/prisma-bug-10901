FROM node:16-alpine as base
RUN apk add bash
WORKDIR /usr/src/app
COPY package*.json ./
EXPOSE 3000

FROM base as dev
ENV NODE_ENV=development
WORKDIR /usr/src/app

USER root

RUN npm install
COPY . .
USER node
WORKDIR /usr/src/app

CMD sleep 5 &&  npx prisma migrate reset -f && npm start