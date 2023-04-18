#!/usr/bin/env bash

#
# This file should be used to prepare and run your laravel project use apache after set up your .env file
# Source: https://github.com/
#

# 1. Check if .env file exists
if [ -e .env ]; then
    source .env
else
    echo "It seems you didn´t create your .env file, so we will create one for you."
    cp .env.example .env
    source .env
    # exit 1
fi

# 1. Check if .env file exists
if [[ ! -f opts/sites-available/app.conf ]]; then
    cp opts/sites-available/app.conf.example opts/sites-available/app.conf
fi

# 2. Create docker network
docker network create $NETWORK

# 3. Update local images
docker compose pull

# 6. Add any special configuration if it's set in .env file


# 7. Start proxy
docker compose up -d --build

echo "You web is setting up at http://localhost:$APP_PORT"

exit 0
