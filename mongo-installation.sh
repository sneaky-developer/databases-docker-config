#!/bin/bash

#apt-get update

apt install curl sudo systemctl -y

sudo apt-get install gnupg curl -y

curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

touch /etc/apt/sources.list.d/mongodb-org-7.0.list

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo apt-get update

sudo apt-get install -y mongodb-org

ps --no-headers -o comm 1

sudo systemctl start mongod

sudo systemctl daemon-reload

sudo systemctl enable mongod

sudo systemctl status mongod
