FROM node:hydrogen-alpine3.17 AS BUILD
WORKDIR /app
COPY package-lock.json package.json ./
RUN npm i
COPY . .
RUN npm run build


FROM node:hydrogen-alpine3.17 AS PROD
WORKDIR /app
RUN npm i -D serve
COPY --from=BUILD /app/dist ./
CMD ["serve"]

