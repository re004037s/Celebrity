#!/bin/bash

docker-compose run app bundle install
docker-compose build
docker-compose run app npm install
docker-compose run app npm audit fix
docker-compose up -d
docker-compose run app bundle exec rake db:setup