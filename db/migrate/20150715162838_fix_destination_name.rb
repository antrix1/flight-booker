class FixDestinationName < ActiveRecord::Migration
  def change
    rename_column(:flights, :destionation_airport_id, :destination_airport_id)
  end
end
