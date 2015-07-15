class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :date
      t.integer :departure_airport_id
      t.integer :destionation_airport_id
      t.float :price

      t.timestamps null: false
    end
  end
end
