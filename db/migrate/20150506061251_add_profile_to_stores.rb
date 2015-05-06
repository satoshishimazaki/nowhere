class AddProfileToStores < ActiveRecord::Migration
  def change
    add_column :stores, :profile, :string
  end
end
