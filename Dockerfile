# Use the official Nginx image as the base
FROM nginx:alpine

# Copy the website files to the Nginx html directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
