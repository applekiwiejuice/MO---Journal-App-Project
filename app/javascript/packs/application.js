// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "@fortawesome/fontawesome-free/css/all"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import 'bootstrap'
import 'jquery'
import '../custom/testing_if_jquery_works.js'
import '../stylesheets/application'
import '../stylesheets/normalize'
import '../stylesheets/cover'
import '../stylesheets/signin'
import '../stylesheets/signup'
import '../stylesheets/edit_account'

document.addEventListener('turbolinks:load', () => {
     $('[data-toggle="tooltip"]').tooltip()
     $('[data-toggle="popover"]').popover()
})