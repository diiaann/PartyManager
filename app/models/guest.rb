class Guest < ActiveRecord::Base
  attr_accessible :host_id, :name, :email, :notes
end
