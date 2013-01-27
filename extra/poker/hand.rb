class Poker::Hand
  def initialize(game)
    @game = game

    play
  end

  private

  def play
    # Deal each player two hole cards
    # Decide preflop bets
    # Work out if someone has won the hand (this will happen every time)
    # Flop
    # Turn
    # River
    # Once decided, take money off player
  end 

  def player1
    @game.player1
  end

  def player2
    @game.player2
  end
end