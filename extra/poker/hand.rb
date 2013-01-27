class Poker::Hand

	attr_writer :pot

  def initialize(game)
    @game = game
		@history = []

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

  def get_state:
    HandState.new(
      @game.player1.stack,
			@game.player2.stack,
			@pot,
			[],
			@history
		)
  end

  def push_history(player, type, amount)
		action = Action.new(player, type, amount)
		@history << action
  end

  def player1
    @game.player1
  end

  def player2
    @game.player2
  end
end
