class Poker::Game

  START_STACK = 1500
  BIG_BLIND = 50
  SMALL_BLIND = 25

  attr_accessor :player1, :player2

  def initialize(player1, player2){}
    @player1 = player1
    @player2 = player2
    @hands = []
  end

  def play
    until @player1.bust? or @player2.bust?
      @hand = Hand.new(self, dealer)
      @hands << hand
    end
  end

  private

  # TODO this is dumb but will work for heads up
  def dealer
    if @hand
      (@hand.dealer == @player1) ? @player2 : @player1
    else
      # coin toss
      (rand(2) == 0) @player1 : @player2
    end
  end
end