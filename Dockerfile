# Create an image for the weather-app
FROM node AS source
RUN mkdir -p /node/weather-app
ADD src/ /node/weather-app
WORKDIR /node/weather-app
RUN npm install

FROM node:alpine
ARG APP_VERSION=V1.1
LABEL org.label-schema.version=$APP_VERSION
ENV NODE_ENV="production"
COPY --from=source /node/weather-app /node/weather-app
WORKDIR /node/weather-app
EXPOSE 3000
ENTRYPOINT ["./bin/www"]
