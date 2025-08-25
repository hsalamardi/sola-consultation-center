#!/bin/sh
set -e

# Replace the default Listen 80 with the PORT environment variable
sed -i "s/Listen 80/Listen ${PORT}/g" /usr/local/apache2/conf/httpd.conf

# Start apache in the foreground
exec httpd-foreground
