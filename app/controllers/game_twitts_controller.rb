# encoding: utf-8
class GameTwittsController < ApplicationController
  layout "game_layout"

  #
  # todo:
  # Для знаменитостей сделать синонимы (мс хаммер рус и инглиш)
  #
  def index 
    
    game_id = params[:game_id].to_i
    @game = Game.find(game_id)
    @twitts = @game.twitts.order("ddate")
    
    @winners = []
    TwittPerson.joins(:twitt => :game).where(:first => 1, :games => {:id => game_id}).each do |tp|
      @winners << {:from_user => tp.twitt.from_user, :person => tp.person.name}
    end   
    @winners.sort! {|a, b| a[:from_user] <=> b[:from_user]}
  end
  
  def go
    game_id = params[:id].to_i
    @game = Game.find(game_id)
    
    get_twitts @game
    #match_people @game
    
    redirect_to game_twitts_path(@game) 
  end

  #private
    def get_twitts game
      date =  game.ddateb.to_date + 1
      timeb = game.ddateb.to_time #Тут время UTC
      timee = game.ddatee.to_time

      @twitts = []
  
      search = Twitter.search("#шрекильичгоголь -rt", {:until => date})
      results = search.results

      while results && (results.first.created_at > timeb) do
        @twitts += results.select do |r|
          timeb <= r.created_at && r.created_at < timee
        end
    
        puts results.first.created_at #search.page - не работает

        search = Twitter.search("#шрекильичгоголь -rt", search.next_page)
        results = search.results
      end

      @twitts.each do |twitt|
        t = Twitt.new
        t.id_str = twitt.id.to_s
        t.ddate = twitt.created_at
        t.text = twitt.text
        t.from_user = twitt.from_user
        t.game_id = game.id   #todo Сделать прасильно!!!!
        
        t.save
      end

      nil
    end
    
    def match_people game
      people = game.people(true) 
      
      game.twitts(true).order("ddate").each do |t|
        people.each do |p|
          
          if TextComparator.compare t, p
            tp = TwittPerson.new
            tp.twitt = t
            tp.person = p

            #Если это первое упоминание знаменитости
            if p.date_first.nil? || p.date_first == t.ddate
              tp.first = 1
              p.date_first = t.ddate
            end
            tp.save
          end
        end
      end
      
      nil
    end
end