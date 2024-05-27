#FROM docker.io/squidfunk/mkdocs-material:latest as BUILDER
FROM ghcr.io/squidfunk/mkdocs-material:9.5.25 as BUILDER
WORKDIR /app
COPY mkdocs.yml /app/mkdocs.yml
COPY docs /app/docs
COPY overrides /app/overrides

# START [revision-date]
# Needed for the mkdocs git revision plugin we use to add page build time as well as page edit time
COPY .git /app/.git
RUN pip3 install mkdocs-git-revision-date-localized-plugin
ENV CI=true
# END [revision-date]

RUN ["mkdocs", "build"]

# FROM nginx:stable-alpine
FROM docker.io/nginx:stable-alpine3.17-slim

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY cloudflare.conf /etc/nginx/cloudflare.conf
COPY deny.conf /etc/nginx/deny.conf

COPY --from=BUILDER /app/site/assets /var/www/documentation/assets
COPY --from=BUILDER /app/site /var/www/documentation

HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1"

EXPOSE 80
