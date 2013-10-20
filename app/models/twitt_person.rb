class TwittPerson < ActiveRecord::Base
  belongs_to :twitt 
  belongs_to :person
  
  validates_uniqueness_of :twitt_id, :scope => :person_id
end