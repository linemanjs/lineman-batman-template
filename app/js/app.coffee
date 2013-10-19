def "FoosballLadder",
  class BatmanApp extends Batman.App
    @resources 'matches'
    @resources 'teams'
    @resources 'users'

    @root 'main#index'

