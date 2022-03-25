# AppRails

## 1st configuration step to create a new application with docker
https://docs.docker.com/samples/rails/

### create:
- Dockerfile

- Gemfile
source 'https://rubygems.org'
ruby '2.7.5'

- touch Gemfile.lock

- docker-compose.yml

- entrypoint.sh

### run
docker-compose run --no-deps app rails new . --force --database=postgresql