dependencies = ['marionette']

define dependencies, (Mn)->
  class Attendance extends Mn.Object
    initialize: ->
      console.log 'attendance started'