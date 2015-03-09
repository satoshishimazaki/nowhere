class AddRememberTokenToStores < ActiveRecord::Migration
  def change
  	add_column :stores, :remember_token, :string
    add_index  :stores, :remember_token
  end
end