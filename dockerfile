FROM node:apline as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
COPY --from=bilder /app/build  /usr/nginx/share/html
