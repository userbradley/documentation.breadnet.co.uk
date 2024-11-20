FROM ghcr.io/squidfunk/mkdocs-material:9.5.45 as BUILDER
WORKDIR /app

ENV color=red
ENV env="Development Server"
ENV nav="navigation.expand"
ENV domain="https://dev-documentation.breadnet.co.uk"
ENV dir="overrides-dev"

COPY mkdocs.yml /app/mkdocs.yml
COPY overrides /app/overrides
COPY dev-robots.txt /app/docs/robots.txt
COPY docs /app/docs

# START [revision-date]
RUN pip3 install mkdocs-git-revision-date-localized-plugin
#COPY .git /app/.git
# END [revision-date]

RUN ["mkdocs", "build"]

FROM nginx:stable-alpine3.17-slim

COPY dev-nginx.conf /etc/nginx/conf.d/default.conf
COPY cloudflare.conf /etc/nginx/cloudflare.conf
COPY deny.conf /etc/nginx/deny.conf
COPY .htpasswd /etc/nginx/.htpasswd

COPY --from=BUILDER /app/site/assets /var/www/documentation/assets
COPY --from=BUILDER /app/site /var/www/documentation

HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1"

EXPOSE 80
