dependencies = ['backbone']

define dependencies, (Backbone)->

  class User extends Backbone.Model
    urlRoot: 'user'

  class Users extends Backbone.Collection
    model: User
    url: 'user'

  class Player extends Backbone.Model
    urlRoot: 'api/v0/players'

  class Players extends Backbone.Collection
    model: Player
    url: 'api/v0/players'

  class Responsable extends Backbone.Model
    urlRoot: 'api/v0/responsables'

  class Responsables extends Backbone.Collection
    model: Responsable
    url: 'api/v0/responsables'

  class Attendance extends Backbone.Model
    urlRoot: 'api/v0/attendance'

  class Attendances extends Backbone.Collection
    model: Responsable
    url: 'api/v0/attendance'

  Entities =
    User: User
    Users: Users
    Player: Player
    Players: Players
    Responsable: Responsable
    Responsables: Responsables
    Attendance: Attendance
    Attendances: Attendances

  return Entities