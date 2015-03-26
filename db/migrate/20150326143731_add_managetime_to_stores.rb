class AddManagetimeToStores < ActiveRecord::Migration
  def change
    add_column :stores, :managetime, :string
  end
end
