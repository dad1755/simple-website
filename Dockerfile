# Use the official Nginx Alpine image
FROM nginx:alpine

# Copy the website files to the Nginx html directory
COPY index.html /usr/share/nginx/html/index.html

# Fix permissions for cache directories
RUN mkdir -p /var/cache/nginx/client_temp /var/cache/nginx/proxy_temp /var/cache/nginx/fastcgi_temp /var/cache/nginx/uwsgi_temp /var/cache/nginx/scgi_temp \
    && chown -R nginx:nginx /var/cache/nginx \
    && chmod -R 755 /var/cache/nginx

# Expose port 80 for web traffic
EXPOSE 8080

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
