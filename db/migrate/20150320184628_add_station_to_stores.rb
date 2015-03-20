class AddStationToStores < ActiveRecord::Migration
  def change
    add_column :stores, :station, :string
  end
end
