dependencies = ['marionette']

define dependencies, (Mn)->
  class Responsable extends Mn.Object
    initialize: ->
      console.log 'responsable started'