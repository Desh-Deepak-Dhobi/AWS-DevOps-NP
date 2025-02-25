#!/bin/bash

echo "Stopping Apache..."
sudo systemctl stop apache2

echo "Removing the existing index.html"
rm -f /var/www/html/index.html
