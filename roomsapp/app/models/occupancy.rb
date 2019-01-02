class Occupancy < ApplicationRecord
  belongs_to :person
  belongs_to :room

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :start_date_before_end_date
  validate :occupancy_overlap

  def start_date_before_end_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:end_date, "must be on or after start date")
    end
  end

  # Room and Person occupancies cannot overlap
  # TODO: There will be a far more elegant and performant way to achieve this. 
  def occupancy_overlap

     if(self.new_record?)

      if Occupancy.where(
           "person_id = :selected_person AND ((end_date BETWEEN :selected_start AND :selected_end) OR (end_date BETWEEN :selected_start AND :selected_end))", 
           {selected_person: person_id, selected_start: start_date, selected_end: end_date}
           ).exists?
        errors.add(:person, "is already allocated for all or some of the selected dates.")
      end 

      if Occupancy.where(
           "room_id = :selected_room AND ((end_date BETWEEN :selected_start AND :selected_end) OR (end_date BETWEEN :selected_start AND :selected_end))", 
           {selected_room: room_id, selected_start: start_date, selected_end: end_date}
           ).exists?
        errors.add(:room, "is already occupied for all or some of the selected dates.")
      end 

     else 

       if Occupancy.where(
            "id NOT IN (:current_id) AND person_id = :selected_person AND ((end_date BETWEEN :selected_start AND :selected_end) OR (end_date BETWEEN :selected_start AND :selected_end))", 
            {current_id: id, selected_person: person_id, selected_start: start_date, selected_end: end_date}
            ).exists?
         errors.add(:person, "is already allocated for all or some of the selected dates.")
       end 

       if Occupancy.where(
            "id NOT IN (:current_id) AND room_id = :selected_room AND ((end_date BETWEEN :selected_start AND :selected_end) OR (end_date BETWEEN :selected_start AND :selected_end))", 
            {current_id: id, selected_room: room_id, selected_start: start_date, selected_end: end_date}
            ).exists?
         errors.add(:room, "is already occupied for all or some of the selected dates.")
       end 

     end 

  end

end
