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
    @game.ddateb = DateTime.new(friday.year, friday.month, friday.day, 18, 0, 0) #, "+04:00")  ???
    @game.ddatee = DateTime.new(friday.year, friday.month, friday.day, 19, 0, 0) #, "+04:00")
  end
  
  def create
    @game = Game.new #(params[:game])   ?????
    @game.date=params[:game][:date]
    @game.timeb=params[:game][:timeb]
    @game.timee=params[:game][:timee]
    
    @game.save
  end
  
  def show
    @games = Game.all
  end
  
  private
    def get_friday
      today = Date.today
      today - today.cwday + 5
    end
      
end
