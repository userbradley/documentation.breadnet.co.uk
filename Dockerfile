# Stage 1: Builder
FROM ghcr.io/squidfunk/mkdocs-material:9.5.49 AS BUILDER
WORKDIR /app

ENV CI=true
# Copy configuration and content files
COPY mkdocs.yml /app/mkdocs.yml
COPY docs /app/docs
COPY overrides /app/overrides

# Include .git for git-revision-date-localized-plugin
COPY .git /app/.git

# Install dependencies and build the site
RUN pip3 install mkdocs-git-revision-date-localized-plugin && \
    mkdocs build

# Clean up unnecessary files
RUN rm -rf /app/.git

# Stage 2: Production
FROM nginx:stable-alpine3.17-slim

# Copy Nginx configuration files
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY cloudflare.conf /etc/nginx/cloudflare.conf
COPY deny.conf /etc/nginx/deny.conf

# Copy built site from the builder stage
COPY --from=BUILDER /app/site/assets /var/www/documentation/assets
COPY --from=BUILDER /app/site /var/www/documentation
COPY docs/.well-known /var/www/documentation/.well-known

# Healthcheck to ensure Nginx is running
HEALTHCHECK CMD curl -s --fail http://localhost:80 || exit 1

# Expose the Nginx port
EXPOSE 80
