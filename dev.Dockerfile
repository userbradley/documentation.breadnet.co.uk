FROM squidfunk/mkdocs-material:latest as BUILDER
WORKDIR /app
COPY . /app


ENV color=red
ENV env="Development Server"
ENV nav="navigation.expand"
ENV domain="https://dev-documentation.breadnet.co.uk"
ENV dir="overrides-dev"

COPY dev-robots.txt /app/docs/robots.txt
RUN ["mkdocs", "build"]


FROM nginx:stable-alpine

COPY dev-nginx.conf /etc/nginx/conf.d/default.conf
COPY cloudflare.conf /etc/nginx/cloudflare.conf
COPY deny.conf /etc/nginx/deny.conf
COPY .htpasswd /etc/nginx/.htpasswd


COPY --from=BUILDER /app/site /var/www/documentation

EXPOSE 80
