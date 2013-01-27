class Poker::Hand
	attr_writer :pot

  def initialize(game, dealer)
    @game = game
    @deck = Deck.new
    @dealer = dealer
    @under_the_gun = (dealer == player1) ? player2 : player1
		@history = []

    play
  end

  private

  def play
    pay_blinds

    # Deal each player two hole cards
    @hole_cards = [HoleCards.new(@under_the_gun, deal(2)), HoleCards.new(@dealer, deal(2))]

    decide_bets(true)

    # Work out if someone has won the hand (this will happen every time)
    # Flop
    # Turn
    # River
    # Once decided, take money off player
  end

  # For the moment we don't play a hand unless both can afford big blind
  def pay_blinds
    @dealer.pay(@game.small_blind)
    @under_the_gun.pay(@game.big_blind)
  end

  def decide_bets(preflop = false)
    if preflop
      first = @dealer
      last = @under_the_gun
    else
      first = @under_the_gun
      last = @dealer
    end

    # TODO 
    action = first.decide()
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
