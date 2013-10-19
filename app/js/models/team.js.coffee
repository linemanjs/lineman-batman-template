def "FoosballLadder.Team",
  class Team extends Batman.Model
    @resourceName: 'teams'
    @storageKey: 'teams'

    @persist Batman.RestStorage

    # Use @encode to tell batman.js which properties Rails will send back with its JSON.
    # @encodeTimestamps()

    @hasMany 'users', foreignKey: 'team_id'

    @hasMany 'team_ones', { foreignKey: 'team_one_id', name: 'Team' }
    @hasMany 'team_twos', { foreignKey: 'team_two_id', name: 'Team' }

    @encode 'name', 'rating'
