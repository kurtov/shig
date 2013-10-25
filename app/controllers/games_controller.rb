# encoding: utf-8
class GamesController < ApplicationController
  #layout "game_layout", :only => :edit
  before_filter :find_game, :only => [:edit, :update, :destroy]
  
  def new
    @game = Game.new
    
    #Найдем пятницу текущей недели
    friday = get_friday
    @game.ddateb = Time.zone.parse("#{friday} 18:00").to_datetime
    @game.ddatee = Time.zone.parse("#{friday} 19:00").to_datetime
  end
  
  def create
    @game = Game.new(params[:game])
        
    if @game.save
      flash[:success] = "Игра успешно сохранена"
      redirect_to game_persons_path(@game)
    else
      render :new
    end
  end
  
  def index
    @games = Game.all
  end
  
  def edit
  end
  
  def update
    if @game.update_attributes(params[:game])
      flash[:success] = "Игра успешно обновлена"
      redirect_to games_path
    else
      render :edit
    end
  end
  
  def destroy
    @game.destroy
    
    @games = Game.all
    
    flash[:success] = "Игра успешно удалена"
    redirect_to games_path
  end
  
  private
    def find_game
      game_id = params[:id].to_i
      @game = Game.find(game_id)
    end
  
    def get_friday
      today = Date.today
      today - today.cwday + 5
    end      
end