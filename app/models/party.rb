class Party < ActiveRecord::Base
  attr_accessible :party_type_id, :host_id, :name, :location_id, :party_date, :start_time, :end_time, :description, :rsvp_date
  
  #Relationships
  has_many :invitations
  belongs_to :party_type
  belongs_to :location
end
