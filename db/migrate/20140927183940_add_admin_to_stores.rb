class AddAdminToStores < ActiveRecord::Migration
  def change
    add_column :stores, :admin, :boolean, default: false
  end
end
