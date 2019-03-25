#!/usr/bin/env bash

brew services start rabbitmq
brew services start redis
sudo mysql.server start

/usr/local/Cellar/nacos/bin/startup.sh -m standalone

