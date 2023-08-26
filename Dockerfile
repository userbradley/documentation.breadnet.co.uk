FROM squidfunk/mkdocs-material:latest as BUILDER
WORKDIR /app
COPY mkdocs.yml /app/mkdocs.yml
COPY docs /app/docs
COPY overrides /app/overrides

RUN ["mkdocs", "build"]

FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY cloudflare.conf /etc/nginx/cloudflare.conf
COPY deny.conf /etc/nginx/deny.conf

COPY --from=BUILDER /app/site/assets /var/www/documentation/assets
COPY --from=BUILDER /app/site /var/www/documentation

EXPOSE 80
