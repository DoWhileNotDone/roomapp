class HomeController < ApplicationController
  def index

      @rooms = Room.all
      @persons = Person.all

      @today = DateTime.now
      @current_occupancy = Occupancy.where("start_date <= '#{@today}' AND end_date >= '#{@today}'").all

      #As we have the current occupancy, and we know one room and person
      #       is an occupant at any given date.
      #       We can now calculate the number of unoccupied rooms, and unallocated persons
      @unoccupied_rooms_count = @rooms.count - @current_occupancy.count
      @unallocated_persons_count = @persons.count - @current_occupancy.count

      #Find allocations that expire within a week
      @expiring_occupancies_count = Occupancy.where("start_date <= '#{@today}' AND end_date <= '#{@today + 7}'").count

  end
end
