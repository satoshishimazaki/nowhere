class ChangeDatatypeTelOfStores < ActiveRecord::Migration
  def change
  	change_column :stores, :tel, :text
  end
end
