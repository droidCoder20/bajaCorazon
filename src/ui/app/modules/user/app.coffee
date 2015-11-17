dependencies = ['marionette']

define dependencies, (Mn)->
  class User extends Mn.Object
    initialize: ->
      console.log 'user started'