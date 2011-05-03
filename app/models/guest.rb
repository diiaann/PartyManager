class Guest < ActiveRecord::Base
  attr_accessible :host_id, :name, :email, :notes
  
  #Relationships
  belongs_to :host
  has_many :invitations
  has_many :gifts, :through => :invitations
  has_many :parties, :through => :invitations
  
  
  #Scopes
  scope :all, order('name')
  
  #Validations
  validates_presence_of :name
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => "is not a valid format"
  
end
