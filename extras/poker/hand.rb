class Poker::Hand
  DEALER small blind

  def initialize(game, dealer)
    @game = game
    @deck = Deck.new
    @dealer = dealer
    @under_the_gun = (dealer == player1) ? player2 : player1

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

  def player1
    @game.player1
  end

  def player2
    @game.player2
  end
end