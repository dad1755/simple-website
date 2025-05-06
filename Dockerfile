# Use the official Apache HTTP Server Alpine image
FROM httpd:alpine

# Copy the website files to the Apache htdocs directory
COPY index.html /usr/local/apache2/htdocs/index.html

# Fix permissions for Apache directories
RUN mkdir -p /usr/local/apache2/logs /usr/local/apache2/cache \
    && chown -R apache:apache /usr/local/apache2 \
    && chmod -R 755 /usr/local/apache2

# Update Apache configuration to listen on port 8080
RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf

# Ensure Apache runs as non-root user (Apache already uses 'apache' user in this image)
# No additional user changes needed, as httpd:alpine runs as non-root by default

# Expose port 8080 for web traffic
EXPOSE 8080

# Start Apache when the container runs
CMD ["httpd-foreground"]
