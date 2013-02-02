class GamesController < ApplicationController
  load_and_authorize_resource
  respond_to :html
  
  def show
  end

  def new
    @current_bot = Bot.find(params[:bot])
    @bots = Bot.where("user_id IS NOT ?", current_user.id)
  end

  def create
    if @game.save
      respond_with @game
    else
    end
  end

end
