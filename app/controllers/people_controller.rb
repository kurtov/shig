# encoding: utf-8
class PeopleController < ApplicationController
  before_filter :find_person, :only => [:edit, :update, :destroy]
  
  def index
    @people = Person.all(:order => :name)
  end
  
  def new
    @person = Person.new
=begin    
    if params[:game_id]
      game_id = params[:game_id].to_i
      @game = Game.find(game_id)
    end
=end    
  end

  def create
    @person = Person.new(params[:person])
    
    if @person.save
      flash[:success] = "Знаменитость успешно сохранена"
      redirect_to edit_person_path @person
    else
      render :new
    end

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
    if params[:game_id]
      game_id = params[:game_id].to_i
      @game = Game.find(game_id)
    end
  end

  def update
    if @person.update_attributes(params[:person])
      flash[:success] = "Знаменитость успешно обновлена"
      redirect_to people_path
    else
      render :edit
    end
=begin
    # В зависимости от того откуда пришел запрос - туда и редирект
    if params[:game_id]
      game_id = params[:game_id].to_i
      @game = Game.find(game_id)
      redirect_to game_persons_path(@game)
    elsif
      redirect_to people_path
    end
=end
  end    
  
  def destroy
    @person.destroy
 
    redirect_to people_path #Если сделать render, то останится ссылка на удаление и F5 упадет
  end
  
  private
    def find_person
      id = params[:id]
      @person = Person.find(id)
    end
end