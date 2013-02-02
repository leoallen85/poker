class BotsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    default_lines = params[:bot][:code].lines.first(2)
    
    if default_lines[0].scan(/\"/).length == 2 &&  !!(default_lines[1].chomp == "# Keep theses lines and start coding from the next line.")

      name = default_lines[0].split(": \"")[1].split("\"")[0].chomp
      name = ( name == "Define your AI name here." ? current_user.name + current_user.bots.count.to_s : name )
      code = params[:bot][:code].lines.drop(2).join

      @bot.name = name
      @bot.code = code
      @bot.user_id = current_user.id

      if @bot.save
        redirect_to new_game_path(bot: @bot.slug), notice: "Good! Let's try your AI now, find someone to play with."
      else
        redirect_to :back, error: "Something went wrong.."
      end

    else
      flash[:error] = "There's something wrong with your code, you must keep our instruction lines."
      render action: "new"
    end

  end

  def update
    if @bot.update_attributes(params[:bot])
      redirect_to current_user
    end
  end

end
