# Use a lightweight web server
FROM nginx:alpine

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy HTML and CSS files
COPY index.html index.html
COPY styles.css styles.css
COPY images /usr/share/nginx/html/images

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
