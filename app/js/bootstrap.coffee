$(document).ready ->
  FoosballLadder.currentUser = FoosballLadder.User.createFromJSON({
    email: "foo@foo.com",
    team_id: 4
  });
  FoosballLadder.run()
