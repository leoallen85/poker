class Poker::Action

	TYPE = {
		call: 0,
		fold: 1,
		bet: 2,
		raise: 3,
	}

  def initialize(player, type, amount)
    @player = player
    @type = TYPE[type]
    @amount = amount
  end
	
  def player
		@player
  end

  def type
		@type
  end

  def amount
    @amount
  end

end
