class GamePersonsController < ApplicationController
  #layout "game_layout"
  before_filter :find_game, :only => [:index, :new, :create, :destroy]
  
  def index
    # todo
    # отругать, если game_id - не число    
    
    @people = @game.people
  end
  
  def new
  end

  #
  # todo
  # Подумать о возможности как-то использовать часть экшена create контроллера PeopleController
  def create
   
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
    id = params[:id].to_i

    person = Person.find(id)
    
    @game.people.delete person
    
    redirect_to game_persons_path(@game)
  end
  
  private
    def find_game
      game_id = params[:game_id].to_i
      @game = Game.find(game_id)
    end
  
end