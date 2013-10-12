# encoding: utf-8
class GameTwittsController < ApplicationController
=begin
  ё меняем на е
  мс хаммер рус и инглиш
  
  todo:
  в одном твитте может быть несколько правильных ответов!!!!
=end
  
  
  def index
    puts "<<<<<<<<<#{params}"
    
    game_id = params[:game_id].to_i
    @game = Game.find(game_id)
    @twitts = @game.twitts.order("ddate")
    
    @winners = []
    winners = @game.twitts.where(:result => 1).order("from_user")
    winners.each do |w|
      @winners << {:from_user => w.from_user, :person => w.person.name}
    end
     
  end
  
  def go
    game_id = params[:id].to_i
    @game = Game.find(game_id)
    
    get_twitts @game
    
    redirect_to game_twitts_path(@game) 
  end

  #private
    def get_twitts game
      date =  game.ddateb.to_date + 1
      timeb = (game.ddateb.in_time_zone("Moscow")-4*60*60).to_time  #+(20*60)).to_time
      timee = (game.ddatee.in_time_zone("Moscow")-4*60*60).to_time

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
      people = []

      game.people.each do |p|
        people << {:person => p, :name => p.name.mb_chars.upcase.to_s.gsub(/Ё/, "Ё" => "Е").split.sort, :ddate => nil}
      end
      
      game.twitts.order("ddate").each do |t|
        text = t.text.mb_chars.upcase.to_s.gsub(/Ё/, "Ё" => "Е").split.sort

        people.each do |p|
          if text & p[:name] == p[:name]
            t.person_id = p[:person].id
            
            if p[:ddate].nil? || p[:ddate] == t.ddate
              t.result = 1
              p[:ddate] = t.ddate
            end
            t.save
            
            
            puts "ok!"
            break
          end
        end
        puts "#{text}"
#        twitts << {:twitt => t, :name => t.text.mb_chars.upcase.gsub(/Ё/, "Ё" => "Е")}
      end
      
      people.each {|x| puts "#{x[:name]}"}
      nil
    end
end