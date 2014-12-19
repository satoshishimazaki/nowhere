class AddImageOneToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_one, :string
  end
end
