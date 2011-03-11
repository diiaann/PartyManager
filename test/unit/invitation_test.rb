require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Invitation.new.valid?
  end
  context do
    setup do
      @birthday = Factory.create(:party_type, :name=>"birthday", :active => true)
      @dian = Factory.create(:host,:username=>"Dian", :email=>"diiaann@gmail.com", :first_name=>"Diandian", :last_name=>"Xiao", :password=>"blah123", :password_confirmation=>"blah123")
      @myHouse = Factory.create(:location,:host_id=>@dian, :name=>"Home", :street=>"Central St", :city=>"Holliston", :state=>"Massachusetts", :zip=>"01746", :latitude=>10.1, :longitude=>10.2)
      @jonsBday = Factory.create(:party,:party_type_id=>@birthday, :host_id=>@dian, :name=>"Jon's Birthday", :location_id=>"myHouse", :party_date=>1.month.from_now, :start_time=>Time.now, :end_time=>Time.now, :description=>"Celebrate!", :rsvp_date=>3.weeks.from_now)
      @friend1 = Factory.create(:guest, :host_id=>@dian, :name=>"Julia's Family", :email=>"jlk@gmail.com", :notes=>"none")
      @invite1 = Factory.create(:invitation, :party_id=>@jonsBday, :guest_id=>"friend1", :invite_code=>"1290unbk89", :expected_attendees=>4, :actual_attendees=>3)
    end
    teardown do
      @dian.destroy
      @birthday.destroy
      @myHouse.destroy
      @jonsBday.destroy
      @friend1.destroy
      @invite1.destroy
    end
    
  end
end
