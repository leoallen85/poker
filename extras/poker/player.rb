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

  def join_game(start_stack)
    @stack = start_stack
    self
  end

  def all_in
    @stack
  end

  def bust?(game)
    @stack < game.big_blind
  end

  # Loses money from stack
  def pay(amount)
    throw new Exception unless @stack >= amount
    @stack -= amount
  end

  # Gains money from stack
  def win(amount)
    @stack += amount
  end
end
