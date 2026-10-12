```bash
#!/bin/bash
set -e

# Update packages and install required software
apt-get update -y
apt-get install -y apache2 curl unzip

# Download website template
cd /tmp
curl -fL -o 2170_aperture.zip https://www.tooplate.com/zip-templates/2170_aperture.zip

# Extract website files
unzip -o 2170_aperture.zip

# Copy website files to Apache directory
cp -r /tmp/2170_aperture/. /var/www/html/

# Start and enable Apache
systemctl enable apache2
systemctl restart apache2
```
