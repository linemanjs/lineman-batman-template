def "FoosballLadder.Match",
  class Match extends Batman.Model
    @resourceName: 'matches'
    @storageKey: 'matches'

    @persist Batman.RestStorage

    # Use @encode to tell batman.js which properties Rails will send back with its JSON.
    # @encode 'name'
    @encode 'team_one_id', 'team_two_id', 'team_one_score', 'team_two_score', 'team_one_accepted_results', 'team_two_accepted_results'

    @belongsTo 'team_one', name: 'Team', foreignKey: 'team_one_id'
    @belongsTo 'team_two', name: 'Team', foreignKey: 'team_two_id'

    # @encodeTimestamps()

    @accessor 'needsRecord', ->
      !(@get('team_one_score') && @get('team_two_score'))

    @accessor 'needsConfirmation', ->
      !(@get('team_one_accepted_results') && @get('team_two_accepted_results')) && !@get('needsRecord')

    @accessor 'isTeamOneCurrent', ->
      @get('team_one_id') == FoosballLadder.currentUser.get('team_id')

    @accessor 'opposingTeam', ->
      return @get('team_two') if @get('isTeamOneCurrent')
      return @get('team_one')

