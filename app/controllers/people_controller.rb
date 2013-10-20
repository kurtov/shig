class PeopleController < ApplicationController
  def index
    @people = Person.all(:order => :name)
  end
  
  def new
    if params[:game_id]
      game_id = params[:game_id].to_i
      @game = Game.find(game_id)
    end    
  end

  def create
    @people = Person.new
    @people.name = params[:person][:name]
    
    @people.save
    
    redirect_to people_path
=begin
    # В зависимости от того откуда пришел запрос - туда и редирект
    if params[:game_id]
      game_id = params[:game_id].to_i
      @game = Game.find(game_id)
      redirect_to game_persons_path(@game) #, @person)
    elsif
      redirect_to people_path
    end
=end
  end
  
  def edit
    id = params[:id].to_i
    @person = Person.find(id)
    
    if params[:game_id]
      game_id = params[:game_id].to_i
      @game = Game.find(game_id)
    end
  end

  def update
    id = params[:id].to_i
    @person = Person.find(id)
    
    @person.name = params[:person][:name]
    @person.save

    # В зависимости от того откуда пришел запрос - туда и редирект
    if params[:game_id]
      game_id = params[:game_id].to_i
      @game = Game.find(game_id)
      redirect_to game_persons_path(@game) #, @person)
    elsif
      redirect_to people_path
    end
  end    
  
  def destroy
    id = params[:id]
    @people = Person.find(id)
    @people.destroy
    
   # @games = Game.all
    redirect_to people_path #Если сделать render, то останится ссылка на удаление и F5 упадет
  end
end