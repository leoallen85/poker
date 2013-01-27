class BotsController < ApplicationController

  def index
    @bots = Bot.all
  end

  def show
    @bot = Bot.find([params:id])
  end

  def new
    @bot = Bot.new
  end


  def update
    
  end

end
