dependencies = ['marionette']

define dependencies, (Mn)->
  class Player extends Mn.Object
    initialize: ->
      console.log 'player started'