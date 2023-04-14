FROM node:hydrogen-alpine3.17 AS BUILD
WORKDIR /app
COPY package-lock.json package.json ./
RUN npm i
COPY . .
RUN npm run build


FROM alpine:3.17.2 AS PROD
RUN apk update
RUN apk add nginx
COPY nginx/default.conf /etc/nginx/http.d/
COPY --from=BUILD /app/dist/ /var/www/

CMD ["nginx", "-g", "daemon off;"] 

