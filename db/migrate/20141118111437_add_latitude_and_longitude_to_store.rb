class AddLatitudeAndLongitudeToStore < ActiveRecord::Migration
  def change
    add_column :stores, :latitude, :float
    add_column :stores, :longitude, :float
    add_column :stores, :address, :string
  end
end
