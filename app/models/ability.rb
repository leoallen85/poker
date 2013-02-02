class Ability
  include CanCan::Ability

  def initialize(user)

    can [:new], Bot

    unless user
    else
      can [:new, :create], Bot
      can :update, Bot do |bot|
        bot.user_id == user.id
      end
      can [:new, :show, :create], Game
      can [:show], User
    end

  end
end
