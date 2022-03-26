// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Requires static assets
// to use it image_pack_tag 'media/images/my-image.jpg'
const images = require.context("../images", true)
const imagePath = name => images(name, true)

// JS
import "jquery"
import "bootstrap"

// CSS
import "stylesheets/home.scss"