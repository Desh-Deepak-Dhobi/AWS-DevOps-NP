#!/bin/bash

# Check if Apache is installed
if ! dpkg -l | grep -q apache2; then
    echo "Apache2 is not installed. Installing now..."
    sudo apt update -y
    sudo apt install apache2 -y
    sudo systemctl enable apache2
    sudo systemctl restart apache2
    echo "Apache2 installation completed."
else
    echo "Apache2 is already installed. No action needed."
fi
