# AppRails
![ruby version](https://img.shields.io/badge/ruby-2.7.5-green)
![rails version](https://img.shields.io/badge/rails-6.1.5-red)
![webpacker version](https://img.shields.io/badge/webpacker-5.4.3-blue)


- [Create a new Rails 6 app with docker](#create-a-new-rails-6-app-with-docker)
- [Setup Webpacker](#setup-webpacker)
- [Setting up Bootstrap](#setting-up-bootstrap)

## Create a new Rails app with docker

[Docker samples - Rails](https://docs.docker.com/samples/rails/) - ( Made some changes )

### 1. Create:
- `Dockerfile`

- `Gemfile`
  ```
  source 'https://rubygems.org'
  gem 'rails', '~> 6.1.5'
  ```

- touch `Gemfile.lock`

- `docker-compose.yml`

- `entrypoint.sh`

### 2. Run:
```
$ docker-compose run --no-deps app rails new . --force --database=postgresql
```
### 3. Delete:
- `container` and `images`
### 4. Run:
```
$ docker-compose build
```

### 5. Modify config/`database.yml`
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

### 6. Run:
```
$ docker-compose up
$ docker-compose exec app rake db:create
```

### DONE!
http://localhost:3000/

## Setup Webpacker

- modify app/views/layouts/`application.html.erb`
  ```
  stylesheet_link_tag => stylesheet_pack_tag
  ```

- create `stylesheets` folder in app/javascript/packs
- move `application.css` to app/javascript/packs
- rename into `.scss`

- create `src` folder in app/javascript/packs (for JS)
- create `images` folder in app/javascript/packs

- setting up app/javascript/packs/`application.js`

  ```
  ...

  // Requires static assets
  // to use it image_pack_tag 'media/images/my-image.jpg'
  const images = require.context("../images", true)
  const imagePath = name => images(name, true)

  // JS

  // CSS
  ```

### For DEV use HMR:
- modify config/`webpacker.yml`
  ```
  dev_server:
      // SET TO TRUE
      hmr: true

      watch_options: 
        // ADD LINES
        aggregateTimeout: 300
        poll: 500
  ```

- run in other terminal
  ```
  $ docker-compose exec app ./bin/webpack-dev-server
  ```

## Setting up Bootstrap

```
$ yarn add bootstrap@5.1.3
$ yarn add jquery@3.6.0
$ yarn add @popperjs/core@^2.10.2
```

- modify app/javascript/packs/`application.js`
  ```
  ...

  // JS
  // ADD LINES
  import "jquery"
  import "bootstrap"

  ...
  ```

- modify app/javascript/packs/`application.scss`
  ```
  // ADD LINES
  @import "bootstrap"

  ...
  ```
