require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
   test "visiting the index" do
     visit persons_url
  
     assert_selector "a", text: "View People"
     assert_selector "a", text: "New Person"

   end

   test "creating a valid person" do
     visit persons_url

     click_on "New Person"
     
     click_on "Save Person"
     
     assert_text "3 errors prevented this person from being saved"
     assert_text "Name can't be blank"
     assert_text "Name is too short"
     assert_text "Date of birth can't be blank"

     fill_in "person_name", with: "T"
     click_on "Save Person"

     assert_text "2 errors prevented this person from being saved"
     assert_no_text "Name can't be blank"
     assert_text "Name is too short"
     assert_text "Date of birth can't be blank"

     fill_in "person_name", with: "Test Person"
     click_on "Save Person"

     assert_text "1 error prevented this person from being saved"
     assert_no_text "Name can't be blank"
     assert_no_text "Name is too short"
     assert_text "Date of birth can't be blank"

     fill_in "person_date_of_birth", with: "12/12/2999"
     click_on "Save Person"
     assert_text "1 error prevented this person from being saved"
     assert_text "Date of birth can't be in the future"

     fill_in "person_date_of_birth", with: "12/12/1956"
     click_on "Save Person"
     assert_no_text "1 error prevented this person from being saved"

     assert_text "View Person"
     assert_selector "div", text: "View Person"     
     assert_selector "p", text: "Test Person"     

     visit persons_url

     click_on "New Person"

     fill_in "person_name", with: "Test Person"
     click_on "Save Person"

     assert_text "2 errors prevented this person from being saved"
     assert_text "Name has already been taken"
     
   end

end
