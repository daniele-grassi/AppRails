# AppRails

## 1st configuration step to create a new application with docker
https://docs.docker.com/samples/rails/

Made some changes!

### create:
- Dockerfile

- Gemfile
```
source 'https://rubygems.org'
gem 'rails', '~> 6.1.5'
```

- touch Gemfile.lock

- docker-compose.yml

- entrypoint.sh

### run:
```
$ docker-compose run --no-deps app rails new . --force --database=postgresql
```
delete container and images
```
$ docker-compose build
```

### modify config/database.yml
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5

development:
  <<: *default
  database: app_development


test:
  <<: *default
  database: app_test
```

### run:
```
$ docker-compose up
$ docker-compose run app rake db:create
```

### DONE!
http://localhost:3000/