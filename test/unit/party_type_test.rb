require 'test_helper'

class PartyTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PartyType.new.valid?
  end
  context "Creating party types" do
    setup do
      @birthday = Factory.create(:party_type, :name=>"birthday", :active => true)
      @bbq = Factory.create(:party_type, :name=>"bbq" :active => false)
    end
    teardown do
      @birthday.destroy
      @bbq.destroy
    end
    should "Check to see if created" do
      assert_equal "birthday", @birthday.name
      assert_equal "bbq", @bbq.name
      assert_equal true, @birthday.active
      assert_equal false, @bbq.active
    end
  end
end
