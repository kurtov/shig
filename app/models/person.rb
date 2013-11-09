# encoding: utf-8
class Person < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true
  validates :name, :uniqueness => true
  
  has_many :game_person
  has_many :games, through: :game_person
  
  has_many :twitt_person
  has_many :twitts, through: :twitt_person
  
  has_many :synonyms
  
  #Виртуально поле. Используется для хранения даты первого упоминания в игре
  attr_accessor :date_first
end