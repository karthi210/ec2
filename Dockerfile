FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache git python3 make g++

RUN corepack enable

COPY . .

RUN yarn install

EXPOSE 9000

CMD ["yarn","dev"]
