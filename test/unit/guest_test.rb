require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Guest.new.valid?
  end
  context do
    setup do
      @dian = Factory.create(:host,:username=>"Dian", :email=>"diiaann@gmail.com", :first_name=>"Diandian", :last_name=>"Xiao", :password=>"blah123", :password_confirmation=>"blah123")
      @friend1 = Factory.create(:guest, :host_id=>@dian, :name=>"Julia's Family", :email=>"jlk@gmail.com", :notes=>"none")
    end
    teardown do
      @dian.destroy
      @friend1.destroy
    end
    should "show that all factories are properly created" do
      assert_equal "Julia's Family", @friend1.name
    end
  end
end
end
