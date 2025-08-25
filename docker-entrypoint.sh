# Cloud Run–ready Apache (httpd) container
FROM httpd:2.4

# Copy website content into the default docroot
COPY public/ /usr/local/apache2/htdocs/

# Add a small entrypoint that sets Apache's Listen to $PORT at runtime
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Use our entrypoint to patch conf and start httpd in foreground
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
