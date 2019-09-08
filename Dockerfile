FROM node:alpine as builder

RUN apk add yarn

WORKDIR /app/

COPY package.json .
RUN yarn install
COPY . .
RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

