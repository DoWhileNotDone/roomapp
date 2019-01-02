class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :location
      t.text :care_facilities

      t.timestamps
    end
  end
end
