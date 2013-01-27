class Poker::Hand
<<<<<<< HEAD:extra/poker/hand.rb

	attr_writer :pot

  def initialize(game)
    @game = game
		@history = []
=======
  DEALER small blind

  def initialize(game, dealer)
    @game = game
    @deck = Deck.new
    @dealer = dealer
    @under_the_gun = (dealer == player1) ? player2 : player1
>>>>>>> f07e3dd6db780db1404c13833957bdbc3effd138:extras/poker/hand.rb

    play
  end

  private

  def play
    # Deal each player two hole cards
    @hole_cards = [HoleCards.new(@under_the_gun, deal(2)), HoleCards.new(@dealer, deal(2))]

    # Subtract blinds

    # Decide preflop bets
    bet

    # Work out if someone has won the hand (this will happen every time)
    # Flop
    # Turn
    # River
    # Once decided, take money off player
  end

  def bet
    
  end

  def deal(cards)
    @deck.deal(cards)
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
