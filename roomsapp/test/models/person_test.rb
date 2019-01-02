require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  test "should not save person without no details" do
    person = Person.new
    assert_not person.save
  end

  test "save valid person" do
    person = Person.new
    person.name = 'Test Person'
    person.date_of_birth = DateTime.now
    assert person.save

  end

  test "should not save person with duplicate name" do
    person = Person.new
    person.name = 'Test Person'
    person.date_of_birth = DateTime.now
    assert person.save

    person_dup = Person.new
    person_dup.name = 'Test Person'
    person_dup.date_of_birth = DateTime.now

    assert_not person_dup.save

  end

  test "should not save person with name with less than 3 chars" do
    person = Person.new
    person.date_of_birth = DateTime.now
    person.name = 'T'
    assert_not person.save

    person.name = 'To'
    assert_not person.save

    person.name = 'Too'
    assert person.save


  end

  test "should not save person with future date of birth" do
    person = Person.new
    person.name = 'Test Person'
    person.date_of_birth = DateTime.tomorrow 
    assert_not person.save

  end

  test "can delete person with past occupancy" do

    person = people(:one)
    assert person.can_delete

    occupancy = Occupancy.new
    occupancy.person_id = person.id
    occupancy.room_id = rooms(:one).id
    occupancy.start_date = Date.today - 1
    occupancy.end_date = Date.today - 1

    assert occupancy.save

    assert person.can_delete

  end

  test "cannot delete person with current occupancy" do

    person = people(:one)
    assert person.can_delete

    occupancy = Occupancy.new
    occupancy.person_id = person.id
    occupancy.room_id = rooms(:one).id
    occupancy.start_date = Date.today
    occupancy.end_date = Date.today
    assert occupancy.save

    assert_not person.can_delete

  end

  test "cannot delete person with future occupancy" do

    person = people(:one)
    assert person.can_delete

    occupancy = Occupancy.new
    occupancy.person_id = person.id
    occupancy.room_id = rooms(:one).id
    occupancy.start_date = Date.today + 1
    occupancy.end_date = Date.today + 1
    assert occupancy.save

    assert_not person.can_delete

  end

end
