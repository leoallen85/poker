class Poker::Player
  def initialize(ai_code)
    @ai_code = ai_code
  end

  def join_game(start_stack)
    @stack = start_stack
  end

  def decide(hand)
    @ai_code.decide(hand)
  end

  def bust?
    @stack == 0
  end
end