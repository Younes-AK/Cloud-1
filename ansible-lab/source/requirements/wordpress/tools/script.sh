#!/bin/bash

mkdir -p /var/www/wp
cd /var/www/wp

until nc -z mariadb 3306; do
    echo "Waiting for MariaDB to be ready..."
    sleep 1
done

# If WordPress is not yet installed
if [ ! -f wp-config.php ]; then
    echo "WordPress is not installed yet. Installing WordPress..."

    # Install WP-CLI if not already installed
    if ! command -v wp; then
        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        chmod +x wp-cli.phar
        mv wp-cli.phar /usr/local/bin/wp
    fi

    echo "Downloading WordPress core..."
    wp core download --allow-root

    echo "Creating wp-config.php..."
    wp config create --allow-root \
        --dbname="${DB_NAME}" \
        --dbuser="${DB_USER}" \
        --dbpass="${DB_PASS}" \
        --dbhost="mariadb:3306"

    if ! wp core is-installed --allow-root; then
        echo "Installing WordPress..."
        wp core install --allow-root \
            --url="https://${DOMAIN_NAME}" \
            --title="${WP_TITLE}" \
            --admin_user="${WP_ADMIN}" \
            --admin_password="${WP_ADMIN_PASS}" \
            --admin_email="${WP_ADMIN_EMAIL}" \
            --skip-email

        echo "Creating user..."
        wp user create "${WP_USER_NAME}" "${WP_USER_EMAIL}" \
            --user_pass="${WP_USER_PASS}" \
            --role=subscriber --allow-root
        echo "WordPress installation completed."
    else
        echo "WordPress is already installed. Skipping installation and user creation."
    fi
echo "WordPress installation completed."
else
    echo "WordPress is already installed. Skipping installation."
fi

chown -R www-data:www-data /var/www/wp


echo "Changing PHP-FPM configuration..."
sed -i 's|^listen = /run/php/php8.2-fpm.sock|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf

mkdir -p /run/php

exec php-fpm8.2 -F
