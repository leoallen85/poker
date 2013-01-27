class Poker::Deck

  SUITS = [:hearts, :spades, :diamonds, :clubs]

  # Note this is ordered, so array key has a meaning here of the hand rank (although ace can be low it rarely is)
  RANK = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]

  def initialize
    create_card_array
  end

  private

  def card_array
    @cards = []

    SUITS.each do |suit|
      RANK.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
  end

end
