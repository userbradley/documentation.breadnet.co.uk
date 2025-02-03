# Stage 1: Builder
FROM ghcr.io/squidfunk/mkdocs-material:9.6.2 as BUILDER
WORKDIR /app

# Set environment variables (usually stable and less likely to change)
ENV color=red \
    env="Development Server" \
    nav="navigation.expand" \
    domain="https://dev-documentation.breadnet.co.uk" \
    dir="overrides-dev"

# Copy configuration and overrides (these change infrequently)
COPY mkdocs.yml /app/mkdocs.yml
COPY overrides /app/overrides

# Install plugins (this changes less often)
RUN pip3 install mkdocs-git-revision-date-localized-plugin

# Copy documentation files (more likely to change, so placed later)
COPY docs /app/docs
COPY dev-robots.txt /app/docs/robots.txt

# Build the site
RUN mkdocs build

# Stage 2: Final Image
FROM nginx:stable-alpine3.17-slim

# Copy configuration files (these are stable and unlikely to change)
COPY dev-nginx.conf /etc/nginx/conf.d/default.conf
COPY cloudflare.conf /etc/nginx/cloudflare.conf
COPY deny.conf /etc/nginx/deny.conf
COPY .htpasswd /etc/nginx/.htpasswd

# Copy built site from the builder stage (the heaviest change)
COPY --from=BUILDER /app/site /var/www/documentation

# Ensure the NGINX config is valid
RUN nginx -t

# Health check for the container
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

# Expose the required port
EXPOSE 80
