# encoding: utf-8
class GamePersonsController < ApplicationController
  #layout "game_layout"
  before_filter :find_game, :only => [:index, :new, :create, :destroy]
  
  def index
    index_init
  end
  
  def new
  end

  def create
=begin
    person = Person.find_by_id(params[:person].to_i)

    if person
      @game.people << person

      flash[:success] = "Знаменитость успешно добавлена"
    else
      flash[:error] = "Знаменитость не найдена"
    end
    
    redirect_to game_persons_path(@game)
    #render :index
=end
    person = Person.find_by_id(params[:person].to_i)

    if person
      @game_person = GamePerson.new(:game => @game, :person => person)
      if @game_person.save
        flash[:success] = "Знаменитость успешно добавлена"
        redirect_to game_persons_path(@game)
      else
        index_init
        render :index
      end
    else
      flash[:alert] = "Знаменитость не найдена"
      redirect_to game_persons_path(@game)
    end
  end

=begin
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
=end
  
  def destroy
    id = params[:id].to_i

    person = Person.find(id)
    
    @game.people.delete person
    
    redirect_to game_persons_path(@game)
  end
  
  private
  
    # todo
    # отругать, если game_id - не число
    def find_game
      game_id = params[:game_id].to_i
      @game = Game.find(game_id)
    end
    
    def index_init
      @people = @game.people
      @all_people = Person.all(:order => :name)   
    end
end