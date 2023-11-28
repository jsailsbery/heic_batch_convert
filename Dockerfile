# Use the official Ubuntu image as the base image
FROM ubuntu

# Update package lists and install ImageMagick
RUN apt-get update && apt-get install -y imagemagick

# Set the working directory
WORKDIR /usr/bin

# Copy the heic_convert.sh script into the container
COPY heic_convert.sh /usr/bin/heic_convert.sh
COPY batch_heic_convert.sh /usr/bin/batch_heic_convert.sh
COPY functions.sh /usr/bin/functions.sh

# Make the script executable
RUN chmod +x /usr/bin/heic_convert.sh /usr/bin/batch_heic_convert.sh /usr/bin/functions.sh

# Execute the heic_convert.sh script when the container starts
CMD ["/usr/bin/batch_heic_convert.sh"]

