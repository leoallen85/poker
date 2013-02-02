class Bot < ActiveRecord::Base
  attr_accessible :name, :code, :user_id
  belongs_to :user
  has_many :games_started, foreign_key: :bot1_id, class_name: "Game"
  has_many :games_played, foreign_key: :bot2_id, class_name: "Game"
  validates_presence_of :name, :code, :user_id
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  def had_played_with? bot2
    Game.where("bot1_id IS ? AND bot2_id IS ?", id, bot2.id).any? || Game.where("bot1_id IS ? AND bot2_id IS ?", bot2.id, id).any?
  end

  def game_with bot2
    Game.where("bot1_id IS ? AND bot2_id IS ?", id, bot2.id).first || Game.where("bot1_id IS ? AND bot2_id IS ?", bot2.id, id).first
  end

  def games
    games_played + games_started
  end

end
