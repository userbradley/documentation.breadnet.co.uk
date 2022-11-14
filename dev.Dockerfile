FROM squidfunk/mkdocs-material:latest as BUILDER
WORKDIR /app
COPY . /app

ENV color=red
ENV env="Development Server"
ENV nav="navigation.expand"
ENV domain="https://dev-documentation.breadnet.co.uk"

RUN ["mkdocs", "build"]


FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=BUILDER /app/site /var/www/documentation

EXPOSE 80