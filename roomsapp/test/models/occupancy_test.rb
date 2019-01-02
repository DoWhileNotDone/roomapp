require 'test_helper'

class OccupancyTest < ActiveSupport::TestCase

  test "should not save occupancy with no details" do
    occupancy = Occupancy.new
    assert_not occupancy.save
  end

end
