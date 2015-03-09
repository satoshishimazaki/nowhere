class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :herenowtitle
      t.string :title
      t.string :content
      t.integer :store_id

      t.timestamps
    end
    add_index :articles, [:store_id, :created_at]
  end
end
