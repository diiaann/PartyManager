class Party < ActiveRecord::Base
  attr_accessible :party_type_id, :host_id, :name, :location_id, :party_date, :start_time, :end_time, :description, :rsvp_date

  #Relationships
  has_many :invitations
  belongs_to :party_type
  belongs_to :location
  belongs_to :host
  has_many :guests, :through => :invitations

  #Validations
  validates_presence_of :name, :message => "Name can't be blank"

  validates_time :start_time, :before => :end_time,
  :before_message => "End time must be after"

  validates_date :party_date, :on_or_after => Date.today,
  :before_message => "Party date must be on or after"


  validates_date :rsvp_date, :allow_blank=>true, :on_or_before => :party_date,
  :before_message => "Rsvp date must be on or before"
  
  
  def create_map_link(zoom=13, width=240, height=240)
    self.location.find_location_coordinates
    markers = "";
    markers +=  "&markers=color:red%7Ccolor:red%7Clabel:#{name}%7C#{location.latitude},#{location.longitude}"
    map = "http://maps.google.com/maps/api/staticmap?center=#{location.latitude},#{location.longitude}&zoom=#{zoom}&size=#{width}x#{height}&maptype=roadmap#{markers}&sensor=false"
  end

  def expected
    return self.invitations.sum('expected_attendees')
  end

  def confirmed
    return self.invitations.sum('actual_attendees')
  end

end
