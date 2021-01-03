FROM webdevops/php-apache:8.0
WORKDIR /app
ENV APP_ENV=prod
ENV WEB_DOCUMENT_ROOT=/app/public

COPY src/bin /app/bin
COPY src/config /app/config
COPY src/migrations /app/migrations
COPY src/public /app/public
COPY src/src /app/src
COPY src/composer.* /app/
COPY src/symfony.lock /app/
COPY wait-for-it.sh .
COPY start.sh .

RUN composer install --no-scripts && \
    composer dump-env prod --empty && \
    chmod +x start.sh && \
    chmod +x wait-for-it.sh

ENTRYPOINT ["./start.sh"]
