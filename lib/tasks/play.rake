desc "Play a game of poker"
task play: :environment do
  game = Poker::Game.new
  game_dealer = Poker::GameDealer.new(game)

  player1 = Poker::Player.new "STEVE"
  player2 = Poker::Player.new "GONAD"

  game_dealer.add_player_to_game player1
  game_dealer.add_player_to_game player2

  game_dealer.deal_game
end