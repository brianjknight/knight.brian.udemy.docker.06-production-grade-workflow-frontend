# Build production app container
FROM node:lts-alpine AS builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# Build nginx container
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
