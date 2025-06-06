FROM openresty/openresty:noble

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      gettext-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create openresty user and group
RUN groupadd -r -g 1001 openresty && \
    useradd -r -g openresty -u 1001 -m -s /bin/bash openresty
# Create necessary directories and set permissions
RUN mkdir -p /var/log/nginx \
             /var/cache/nginx \
             /tmp/nginx \
             /var/lib/nginx \
             /etc/nginx/conf.d && \
# Set ownership for openresty user
    chown -R openresty:openresty /var/log/nginx \
                                 /var/cache/nginx \
                                 /tmp/nginx \
                                 /var/lib/nginx \
                                 /etc/nginx/conf.d \
                                 /usr/local/openresty/nginx

# Copy entrypoint script                                 
COPY entrypoint.d /entrypoint.d
COPY entrypoint.sh /entrypoint.sh

# Switch to non-root user
USER openresty
# Use non-privileged ports
EXPOSE 8080 8443

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]