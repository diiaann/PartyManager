class PartyType < ActiveRecord::Base
  attr_accessible :name, :active
  
  #Relationships
  has_many :parties
  
end
