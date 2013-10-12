class Twitt < ActiveRecord::Base
  belongs_to :person
  belongs_to :game
  
  validates :id_str, uniqueness: true
end