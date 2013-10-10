class GameTwittsController < ApplicationController
  def index
    game_id = params[:game_id].to_i
    @game = Game.find(game_id)
  end
  
  def go
    game_id = params[:id].to_i
    @game = Game.find(game_id)
        
    redirect_to game_twitts_path(@game) 
  end 
end