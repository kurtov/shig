class GamePerson < ActiveRecord::Base
  attr_accessible :game, :person
  
  belongs_to :game 
  belongs_to :person
  
  validates :person_id, uniqueness: { scope: :game_id}
end