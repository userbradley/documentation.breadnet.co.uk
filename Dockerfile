FROM squidfunk/mkdocs-material:latest as BUILDER
WORKDIR /app
COPY . /app

RUN ["mkdocs", "build"]


FROM nginx:stable-alpine

COPY cloudflare /etc/nginx/cloudflare
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=BUILDER /app/site /var/www/documentation

EXPOSE 80