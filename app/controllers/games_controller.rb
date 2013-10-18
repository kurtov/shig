# encoding: utf-8

=begin
   
 todo
 1. надо ли делать +04:00
 2. не работает Game.new(params[:game])
 3. заполнить флеш: удачно/неудачно сохранилось
=end
class GamesController < ApplicationController
  def new
    @game = Game.new
    
    #Найдем пятницу текущей недели
    friday = get_friday
    @game.ddateb = DateTime.new(friday.year, friday.month, friday.day, 18, 0, 0, "+04:00")
    @game.ddatee = DateTime.new(friday.year, friday.month, friday.day, 19, 0, 0, "+04:00")
  end
  
  def create
    @game = Game.new #(params[:game])   ?????
    @game.date=params[:game][:date]
    @game.timeb=params[:game][:timeb]
    @game.timee=params[:game][:timee]
    
    @game.save      #Если бага - ошибка и оставлять на прежнем месте
    
    #render game_persons_path(@game)
    redirect_to game_persons_path(@game)    # Тотчно ли тут нужен redirect_to?
  end
  
  def index
    @games = Game.all
  end
  
  def edit
    id = params[:id].to_i
    @game = Game.find(id)
  end
  
  def update
    game_id = params[:id]
    game = Game.find(game_id)
    
    game.date=params[:game][:date]
    game.timeb=params[:game][:timeb]
    game.timee=params[:game][:timee]
    
    game.save      #Если бага - ошибка и оставлять на прежнем месте
    
    redirect_to games_path
  end
  
  def destroy
    game_id = params[:id]
    game = Game.find(game_id)
    game.destroy
    
    @games = Game.all
    redirect_to games_path #Если сделать render, то останится ссылка на удаление и F5 упадет
  end
  
  private
    def get_friday
      today = Date.today
      today - today.cwday + 5
    end      
end
