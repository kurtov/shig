class GamePersonsController < ApplicationController
  layout "game_layout"
  
  def index
    # todo
    # отругать, если game_id - не число
    # проверка прав
    
    game_id = params[:game_id].to_i
    @game = Game.find(game_id)
    
    @people = @game.people
  end
  
  def new
    game_id = params[:game_id].to_i
    @game = Game.find(game_id)

  end

=begin  
  def edit
    game_id = params[:game_id].to_i
    @game = Game.find(game_id)    
    
    id = params[:id].to_i
    @person = Person.find(id)
  end
  
  
  def update
    game_id = params[:game_id].to_i
    @game = Game.find(game_id)    
    
    id = params[:id].to_i
    @person = Person.find(id)
    
    name = params[:person][:name].to_s
    @person.name = name
    @person.save
    
    #render :edit
    redirect_to edit_game_person_path(@game, @person)
  end
=end
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
    
    puts "render :index"
    render :index
  end
  
  def destroy
    game_id = params[:game_id].to_i
    id = params[:id].to_i
    
    game = Game.find(game_id)
    person = Person.find(id)
    
    game.people.delete person
    
    redirect_to game_persons_path(game)
  end
end