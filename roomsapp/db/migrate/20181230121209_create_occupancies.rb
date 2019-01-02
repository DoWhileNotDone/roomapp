class CreateOccupancies < ActiveRecord::Migration[5.2]
  def change
    create_table :occupancies do |t|
      t.date :start_date
      t.date :end_date
      t.references :person, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
