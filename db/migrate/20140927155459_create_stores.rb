class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :email
      t.integer :tel
      t.string :url

      t.timestamps
    end
  end
end
