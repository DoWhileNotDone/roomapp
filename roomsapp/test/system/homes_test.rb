require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
   test "visiting the home page" do
     visit "/"
  
     assert_selector "h1", text: "Welcome to the Rooms Application"
     assert_selector "a", text: "People"
     assert_selector "a", text: "Rooms"
     assert_selector "a", text: "Occupancies"

   end

end
