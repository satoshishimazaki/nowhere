class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
    add_index :views, :user_id
    add_index :views, :article_id
    add_index :views, [:user_id, :article_id], unique:true 
  end
end
