class AddLatitudeAndLongitudeToSala < ActiveRecord::Migration
  def change
    add_column :salas, :latitude, :float
    add_column :salas, :longitude, :float
  end
end
