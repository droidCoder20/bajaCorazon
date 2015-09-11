dependencies = ['marionette', 'backbone','../router/router', './layout']

define dependencies, (Mn, Backbone, Router, Layout)->
  class App extends Mn.Application
    onStart: ->
      console.log 'Start App'
      @showLayout()
      @startRouter()
      if Backbone.history
        Backbone.history.start()

    startRouter: ->
      new Router()

    showLayout: ->
      layout = new Layout()
      layout.render()

  return App