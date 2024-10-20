#!/bin/bash

# Upgrade the database
superset db upgrade

# Create an admin user if it doesn't exist
superset fab create-admin \
    --username jdoe \
    --firstname John \
    --lastname Doe \
    --email doe@example.com \
    --password Admin123 \
    || echo "Admin user already exists, skipping creation."

# Initialize Superset
superset init

# Start the Superset server
superset run -h 0.0.0.0 -p 8088 --with-threads --reload --debugger
