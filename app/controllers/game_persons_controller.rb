class GamePersonsController < ApplicationController
  def index
    # todo
    # отругать, если game_id - не число
    # проверка прав
    
    game_id = params[:game_id].to_i
    @game = Game.find(game_id)
    
    @people = @game.people
  end
  
  def create
    
    game_id = params[:game_id].to_i
    @game = Game.find(game_id)
    
    
    
    # todo: тут проверить существует ли уже добавляемая персона. если да, то подставить ее id иначе:
    name = params[:person][:name].to_s
    
    if name.present?
      person = Person.new
      person.name = params[:person][:name]
      person.save
      
      @game.people << person
      @people = @game.people      
    else
      #todo тут или поругать или на модель понадеяться  
    end    
    
    render :index
  end
  
  def destroy
    
  end
end