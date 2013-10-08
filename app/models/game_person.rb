class GamePerson < ActiveRecord::Base
  belongs_to :game 
  belongs_to :person
end