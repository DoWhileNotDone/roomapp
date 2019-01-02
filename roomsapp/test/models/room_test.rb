require 'test_helper'

class RoomTest < ActiveSupport::TestCase

  test "should not save room with no details" do
    room = Room.new
    assert_not room.save
  end

  test "should not save room with duplicate name" do
    room = Room.new
    room.name = 'Test Room'
    assert room.save

    room_dup = Room.new
    room_dup.name = 'Test Room'
    assert_not room_dup.save

  end

  test "should not save room with name with less than 3 chars" do
    room = Room.new
    room.name = 'T'
    assert_not room.save

    room.name = 'To'
    assert_not room.save

    room.name = 'Too'
    assert room.save


  end


  test "can delete room with past occupancy" do

    room = rooms(:one)
    assert room.can_delete

    person = people(:one)

    occupancy = Occupancy.new
    occupancy.person_id = person.id
    occupancy.room_id = room.id
    occupancy.start_date = Date.today - 1
    occupancy.end_date = Date.today - 1

    assert occupancy.save

    assert room.can_delete

  end

  test "cannot delete room with current occupancy" do

    room = rooms(:one)
    assert room.can_delete

    person = people(:one)

    occupancy = Occupancy.new
    occupancy.person_id = person.id
    occupancy.room_id = room.id
    occupancy.start_date = Date.today
    occupancy.end_date = Date.today
    assert occupancy.save

    assert_not room.can_delete

  end

  test "cannot delete room with future occupancy" do

    room = rooms(:one)
    assert room.can_delete

    person = people(:one)

    occupancy = Occupancy.new
    occupancy.person_id = person.id
    occupancy.room_id = room.id
    occupancy.start_date = Date.today + 1
    occupancy.end_date = Date.today + 1
    assert occupancy.save

    assert_not room.can_delete

  end

end
