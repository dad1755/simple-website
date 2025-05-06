FROM httpd:alpine

# Create apache user/group (UID 1000 is common, adjust as needed)
RUN addgroup -S apache && adduser -S apache -G apache

COPY index.html /usr/local/apache2/htdocs/index.html

RUN mkdir -p /usr/local/apache2/logs /usr/local/apache2/cache \
    && chown -R apache:apache /usr/local/apache2 \
    && chmod -R 755 /usr/local/apache2

RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf

EXPOSE 8080
CMD ["httpd-foreground"]
