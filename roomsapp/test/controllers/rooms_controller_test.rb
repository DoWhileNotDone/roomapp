require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @room = rooms(:one)
  end

  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should get index" do
     get rooms_url
     assert_response :success
   end

   test "should show room" do
     get room_url(@room)
     assert_response :success
   end

   test "should destroy room" do
     assert_difference('Room.count', -1) do
       delete room_url(@room)
     end
    
     assert_redirected_to rooms_path
   end

   test "should update room" do
    
     patch room_url(@room), params: { room: { name: "updated" } }
    
     assert_redirected_to room_path(@room)
     # Reload association to fetch updated data and assert that name is updated.
     @room.reload
     assert_equal "updated", @room.name
   end

end
