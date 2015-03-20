class AddUrlSecToStores < ActiveRecord::Migration
  def change
    add_column :stores, :url_sec, :string
  end
end
