# 1st configuration step to create a new Rails application with docker

- [Return](../README.md)

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
`container` and `images`
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