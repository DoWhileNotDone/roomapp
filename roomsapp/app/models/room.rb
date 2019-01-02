class Room < ApplicationRecord
  has_many :occupancies, inverse_of: :room

  validates :name, presence: true,
                     length: { minimum: 3 },
                     uniqueness: { case_sensitive: false }

  def can_delete
     !Occupancy.where(
          "room_id = :selected_room AND end_date >= :today", 
          {selected_room: self.id, today: Date.today}
          ).exists?
  end

end
