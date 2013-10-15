# encoding: utf-8
class Twitt < ActiveRecord::Base
  has_many :twitt_person
  has_many :people, through: :twitt_person
  
  belongs_to :game
  
  validates :id_str, uniqueness: true
  
  #
  # todo:
  # Одинаковый метод с Person. Надо как-то вынести общую часть
  #
  def text_to_ary
    text.mb_chars.upcase.to_s.gsub(/Ё/, "Ё" => "Е").split.sort
  end
  
  def first_people
    Person.joins(:twitt_person).where(:twitt_people => {:first => 1, :twitt_id => self.id})
  end
  
  def first_people_to_s
    p = first_people
    
    if p.size == 1
      return "Да"
    else
      if p.size > 1
        return "Да (#{p.map{|person| person.name}.join('; ')})" 
      else
        nil
      end
    end
  end
end