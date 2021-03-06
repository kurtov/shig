class Game < ActiveRecord::Base
  attr_accessible :date, :timeb, :timee

  has_many :twitts

  has_many :game_person
  has_many :people, through: :game_person
  
  before_save :convert_to_datetime
  
  def date
    if @date
      @date
    else
      ddateb.strftime "%d-%m-%Y"
    end 
  end
  
  def timeb
    if @timeb
      @timeb
    else
      ddateb.strftime "%H:%M"
    end
  end
  
  def timee
    if @timee
      @timee
    else
      ddatee.strftime "%H:%M"
    end    
  end
  
  def date= date
    @date = Date.strptime(date, "%d-%m-%Y").strftime("%Y-%m-%d") 
  end
  
  def timeb= time
    @timeb = time #Time.strptime(time, "%H-%M").strftime("%H:%M") 
  end
  
  def timee= time
    @timee = time #Time.strptime(time, "%H-%M").strftime("%H:%M")
  end
  
  def convert_to_datetime
    self.ddateb = DateTime.parse("#{@date} #{@timeb} +04:00")
    self.ddatee = DateTime.parse("#{@date} #{@timee} +04:00")
  end
end