class Invitation < ActiveRecord::Base
  attr_accessible :party_id, :guest_id, :invite_code, :expected_attendees, :actual_attendees
  
  before_create :add_invite_code
  
  #Relationships
  has_many :gifts
  belongs_to :party
  belongs_to :guest
  
  #Validations
  validates_numericality_of :expected_attendees, :only_integer => true, :greater_than => 0
  
  #Callback
  protected
    def add_invite_code
      self.invite_code = rand(36**16).to_s(36)
    end
  
end
