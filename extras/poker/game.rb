class Poker::Game

  START_STACK = 10000

  attr_accessor :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @hands = []
  end

  def play
    until @player1.bust? or @player2.bust?
      hand = Hand.new(self)
      @hands << hand
    end
  end
end
