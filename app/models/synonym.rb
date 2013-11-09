# encoding: utf-8
class Synonym < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :person
  
  validates :name, :presence => true
  validates :name, uniqueness: { scope: :person_id}
end