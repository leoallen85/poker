class Poker::Game

  START_STACK = 1500
  START_BIG_BLIND = 50
  START_SMALL_BLIND = 25

  attr_accessor :player1, :player2

  def initialize(player1, player2)

    @player1 = player1.join_game(START_STACK)
    @player2 = player2.join_game(START_STACK)
    @hands = []
  end

  def play
    until @player1.bust?(self) or @player2.bust?(self)
      @hand = Hand.new(self, button)
      @hands << @hand
    end
  end

  # These might change so wrap them so we can increase them as we go along
  def big_blind
    START_BIG_BLIND
  end

  def small_blind
    START_SMALL_BLIND
  end

  private

  # TODO this is dumb but will work for heads up
  def button
    if @hand
      (@hand.button == @player1) ? @player2 : @player1
    else
      # coin toss
      (rand(2) == 0) @player1 : @player2
    end
  end
end