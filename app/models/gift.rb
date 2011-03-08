class Gift < ActiveRecord::Base
  attr_accessible :invitation_id, :note_sent_on, :description
  
  #Relationships
  belongs_to :invitation
  
  #Validations
  validates_presence_of :note_sent_on, :description
end
