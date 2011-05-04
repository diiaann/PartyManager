require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Location.new.valid?
  end
  #Relationships
  #Validation
  #Context
  context do
    setup do
      @dian = Factory.create(:host,:username=>"Dian", :email=>"diiaann@gmail.com", :first_name=>"Diandian", :last_name=>"Xiao", :password=>"blah123", :password_confirmation=>"blah123")
      @myHouse = Factory.create(:location,:host_id=>@dian, :name=>"Home", :street=>"Central St", :city=>"Holliston", :state=>"Massachusetts", :zip=>"01746", :latitude=>10.1, :longitude=>10.2)
    end
    teardown do
      @dian.destroy
      @myHouse.destroy
    end
    should "show that all factories are properly created" do
      assert_equal "Home", @myHouse.name
      assert_equal "Central St", @myHouse.street
      assert_equal "Holliston", @myHouse.city
    end
  end
end
