class Poker::Hand
  attr_writer :pot

  following_actions = {
    :button_blind,
    :under_the_gun_blind,
    :flop,
    :turn,
    :river,
    # at any time
    :respond_to_raise
  }

  def initialize(game, button)
    @game = game
    @deck = Deck.new

    #posting blinds is an action
    #

    # @button = button
    # @under_the_gun = (button == player1) ? player2 : player1
    # @history = []
    # @plays = 0

    # # dealer starts the action
    # play
  end

  private

  def deal_hole_cards
    # Deal each player two hole cards
    # TODO add hole cards to 
    @hole_cards = [HoleCards.new(@under_the_gun, deal(2)), HoleCards.new(@button, deal(2))]
  end

  def play
    deal_hole_cards

    pay_blinds

    until @dealer.finished_hand?
      @dealer.next_move(self)
    end

    current_player = @button

    do
      next_action = current_player.decide(get_state)
      current_player = next_player(current_player)
      take_action(next_action)
    until next_action.move_on?

    # Work out if someone has won the hand (this will happen every time)
    # Flop
    # Turn
    # River
    # Once decided, take money off player
  end

  def next_player(current_player)
    current_player == @button ? @under_the_gun : @button
  end

  def take_action(action)
    result = send(next_action.method)

    if next_action.requires_dealer_action
      send(next_action.dealer_action)
    end

    result
  end

  def flop
    
  end

  # For the moment we don't play a hand unless both can afford big blind
  def pay_blinds
    @button.pay(@game.small_blind)
    @under_the_gun.pay(@game.big_blind)
  end

  def decide_bets(street = false)
    if preflop
      first = @button
      last = @under_the_gun
    else
      first = @under_the_gun
      last = @button
    end

    # TODO 
    action = first.decide()
    action = second.decide()
  end

  def deal(cards)
    @deck.deal(cards)
  end

  def get_state
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
