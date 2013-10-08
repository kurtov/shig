class GamePersonsController < ApplicationController
  def index
    # todo
    # отругать, если game_id - не число
    # проверка прав
    
    game_id = params[:game_id].to_i
    @game = Game.find(game_id)
  end
  
  def create
    
  end
  
  def destroy
    
  end
end