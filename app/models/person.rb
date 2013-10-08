class Person < ActiveRecord::Base
  has_many :game_person
  has_many :games, through: :game_person
end