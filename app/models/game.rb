class Game < ActiveRecord::Base
  attr_accessible :bot1_id, :bot2_id
  belongs_to :bot1, class_name: "Bot"
  belongs_to :bot2, class_name: "Bot"
end
