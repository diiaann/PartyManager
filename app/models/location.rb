class Location < ActiveRecord::Base
  attr_accessible :host_id, :name, :street, :city, :state, :zip, :latitude, :longitude
  
  #Relationships
  belongs_to :host
  has_many :parties
  
  #Constants
  STATES_LIST = [['Alabama', 'AL'],['Alaska', 'AK'],['Arizona', 'AZ'],['Arkansas', 'AR'],['California', 'CA'],['Colorado', 'CO'],['Connectict', 'CT'],['Delaware', 'DE'],['District of Columbia ', 'DC'],['Florida', 'FL'],['Georgia', 'GA'],['Hawaii', 'HI'],['Idaho', 'ID'],['Illinois', 'IL'],['Indiana', 'IN'],['Iowa', 'IA'],['Kansas', 'KS'],['Kentucky', 'KY'],['Louisiana', 'LA'],['Maine', 'ME'],['Maryland', 'MD'],['Massachusetts', 'MA'],['Michigan', 'MI'],['Minnesota', 'MN'],['Mississippi', 'MS'],['Missouri', 'MO'],['Montana', 'MT'],['Nebraska', 'NE'],['Nevada', 'NV'],['New Hampshire', 'NH'],['New Jersey', 'NJ'],['New Mexico', 'NM'],['New York', 'NY'],['North Carolina','NC'],['North Dakota', 'ND'],['Ohio', 'OH'],['Oklahoma', 'OK'],['Oregon', 'OR'],['Pennsylvania', 'PA'],['Rhode Island', 'RI'],['South Carolina', 'SC'],['South Dakota', 'SD'],['Tennessee', 'TN'],['Texas', 'TX'],['Utah', 'UT'],['Vermont', 'VT'],['Virginia', 'VA'],['Washington', 'WA'],['West Virginia', 'WV'],['Wisconsin ', 'WI'],['Wyoming', 'WY']]

  #Validations
  validates_format_of :zip, :with => /^\d{5}$/, :message => "should be five digits long", :allow_blank => true

  def find_location_coordinates
    str = self.street
    town = self.city
    st = self.state
    coord = Geokit::Geocoders::GoogleGeocoder.geocode "#{str}, #{town}, #{st}"
    if coord.success
	    self.latitude, self.longitude = coord.ll.split(',')
	  else 
	    errors.add_to_base("Error with geocoding")
	  end
  end
  
  def address
    address = "" + self.street + "\n" + self.city + ", " + self.state + " " +self.zip
    return address 
  end
  
end
