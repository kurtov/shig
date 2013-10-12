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
end