# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
ARG API_BASE_URL=http://localhost
ENV VUE_APP_API_BASE_URL=${API_BASE_URL}
COPY src/package*.json ./
RUN npm install
COPY src .
RUN npm run build

# production stage
FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
