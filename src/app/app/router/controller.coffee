dependencies = ['../modules/attendance/app', '../modules/player/app', '../modules/responsable/app', '../modules/user/app']

define dependencies, (Attendance, Player, Responsable, User)->
  Controller =
    showHome: ->
      console.log 'Show Home'

    startAttendance: ->
      @startModule(Attendance)

    startPlayer: ->
      @startModule(Player)

    startResponsable: ->
      @startModule(Responsable)

    startUser: ->
      @startModule(User)

    startModule: (ModuleClass)->
      #mainChannel = Backbone.Radio.channel 'main'
      #mainChannel.trigger 'subapp:stop:current'
      module = new ModuleClass()
      #mainChannel.trigger 'subapp:set:current', module

  return Controller