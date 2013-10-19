def "FoosballLadder.MainController",
  class MainController extends FoosballLadder.ApplicationController
    routingKey: 'main'

    index: (params) ->
      FoosballLadder.Team.load (err,teams) =>
        @set 'teams', teams

      matchParams = matches_for_team: FoosballLadder.currentUser.get('team_id'), needs_action: 1
      FoosballLadder.Match.load matchParams, (err,matches) =>
        @set 'matches', new Batman.Set(matches...)

    @accessor 'indexOf', ->
      new Batman.Accessible (team) =>
        @get('teams').indexOf(team)+1

    challengePushed: (node, event, view) ->
      team = view.lookupKeypath('team')

      match = new FoosballLadder.Match
      match.set('team_one', FoosballLadder.currentUser.get('team'))
      match.set('team_two', team)
      match.save (err,response) =>
        @get('matches').add(response)

    @accessor 'showChallengeButton', ->
      new Batman.Accessible (team) =>
        return false if FoosballLadder.currentUser.get('team_id') == team.get('id')
        return !@get('matches')?.some( (m) -> m.get('team_one_id') == team.get('id') or m.get('team_two_id') == team.get('id'))

    updateMatch: (node, event, view)->
      match = view.lookupKeypath('match')
      match.save (err,response) =>
        @get('matches').remove(match)
        FoosballLadder.Team.load (err,teams) =>
          @set 'teams', teams

