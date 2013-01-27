class Poker::HandState < Struct.new (:chip1, :chip2, :pot, :cards, :history, :button)
end