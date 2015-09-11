dependencies = ['marionette', './controller']

define dependencies, (Mn, Controller)->

  class Router extends Mn.AppRouter
    appRoutes:
      '':             'showHome'
      'attendance':   'startAttendance'
      'player':       'startPlayer'
      'responsable':  'startResponsable'
      'user':         'startUser'

    controller: Controller

  return Router