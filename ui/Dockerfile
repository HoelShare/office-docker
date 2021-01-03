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
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
