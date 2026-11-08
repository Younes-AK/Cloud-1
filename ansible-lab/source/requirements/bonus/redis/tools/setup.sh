#!/bin/bash

sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf

echo maxmemory 256mb >> /etc/redis/redis.conf

echo maxmemory-policy allkeys-lfu >> /etc/redis/redis.conf
