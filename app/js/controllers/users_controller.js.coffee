def "FoosballLadder.UsersController",
  class UsersController extends FoosballLadder.ApplicationController
    routingKey: 'users'

    index: (params) ->
      FoosballLadder.User.load (err,users) =>
        @set 'users', users

    show: (params) ->
      FoosballLadder.User.find params.id, (err,user) =>
        @set 'user', user

