'use strict'
require.config
  paths:
    jquery: 'vendor/jquery/dist/jquery.min',
    underscore: 'vendor/lodash/lodash.min',
    handlebars: 'vendor/handlebars/handlebars.min',
    backbone: 'vendor/backbone/backbone-min',
    'backbone.radio': 'vendor/backbone.radio/build/backbone.radio.min',
    marionette: 'vendor/marionette/lib/backbone.marionette.min',
    materialize: 'vendor/materialize/dist/js/materialize.min'

  shim:
    handlebars:
      exports: 'Handlebars'
    backbone:
      exports: 'Backbone',
      deps: ['jquery', 'underscore']
    materialize:
      exports: 'Materialize'
      deps: ['jquery']

require ['app/app'], (App) ->
    app = new App()
    app.start()