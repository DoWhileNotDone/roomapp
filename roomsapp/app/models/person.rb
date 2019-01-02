class Person < ApplicationRecord
  has_many :occupancies, inverse_of: :person

  validates :name, presence: true,
                   length: { minimum: 3 },
                   uniqueness: { case_sensitive: false }
  validates :date_of_birth, presence: true
  validate :date_of_birth_in_the_past

  def date_of_birth_in_the_past
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "can't be in the future")
    end
  end

  def age
    ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor
  end

  def can_delete
    !Occupancy.where(
         "person_id = :selected_person AND end_date >= :today", 
         {selected_person: self.id, today: Date.today}
         ).exists?
  end

end
