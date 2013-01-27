class Poker::Player
  def initialize(ai_code)
    @ai_code = ai_code
    @stack = Game::START_STACK
  end

  def decide(hand)
    @ai_code.decide(hand)
  end

  def bust?
    @stack == 0
  end
end