def "FoosballLadder.TeamsController",
  class TeamsController extends FoosballLadder.ApplicationController
    routingKey: 'teams'

    index: (params) ->
      FoosballLadder.Team.load (err,teams) =>
        @set 'teams', teams

    show: (params) ->
      FoosballLadder.Team.find params.id, (err,team) =>
        @set 'team', team

    new: (params) ->
      team = new FoosballLadder.Team
      @set 'team', team

    create: ->
      @get('team').save (err,team) ->
        Batman.redirect FoosballLadder.get('routes.teams.path')

    deleteTeam: (node, event, view) ->
      @get('team').destroy (err,response) ->
        Batman.redirect FoosballLadder.get('routes.teams.path')


