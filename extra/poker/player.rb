class Poker::Player

	attr_reader :stack

  def initialize(ai_code)
    @ai_code = ai_code
    @stack = Game::START_STACK
  end

  def decide(state)
    @ai_code.decide(state)
		#NOTE return action object
  end

  def <<(amount)
    @stack += amount
  end

  def -(amount)
    @stack -= amount

    throw new Exception "Negative stack!" unless amount >= 0
  end

  def all_in
    @stack
  end

  def bust?
    @stack == 0
  end
end
