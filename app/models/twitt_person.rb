class TwittPerson < ActiveRecord::Base
  belongs_to :twitt 
  belongs_to :person
end