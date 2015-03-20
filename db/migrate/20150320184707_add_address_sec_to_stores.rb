class AddAddressSecToStores < ActiveRecord::Migration
  def change
    add_column :stores, :address_sec, :string
  end
end
