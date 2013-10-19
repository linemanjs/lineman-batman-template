def "FoosballLadder.User",
  class User extends Batman.Model
    @resourceName: 'users'
    @storageKey: 'users'

    @persist Batman.RestStorage

    # Use @encode to tell batman.js which properties Rails will send back with its JSON.
    @encode 'email'

    @belongsTo 'team', foreignKey: 'team_id'

    # @encodeTimestamps()

