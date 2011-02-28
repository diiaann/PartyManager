class Guest < ActiveRecord::Base
  attr_accessible :host_id, :name, :email, :notes
  belongs_to :host
  has_many :invitations
end
