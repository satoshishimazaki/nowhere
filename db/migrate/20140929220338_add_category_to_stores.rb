class AddCategoryToStores < ActiveRecord::Migration
  def change
    add_column :stores, :category, :string
  end
end
