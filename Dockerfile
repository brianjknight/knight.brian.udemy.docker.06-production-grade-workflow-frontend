# Build production app container
FROM node:lts-alpine AS builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# Build nginx container
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
