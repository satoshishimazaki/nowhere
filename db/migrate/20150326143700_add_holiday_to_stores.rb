class AddHolidayToStores < ActiveRecord::Migration
  def change
    add_column :stores, :holiday, :string
  end
end
