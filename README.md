# AppRails

- [1st configuration step to create a new Rails application with docker](docs/FIRST_CONFIGURATION.md)

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

