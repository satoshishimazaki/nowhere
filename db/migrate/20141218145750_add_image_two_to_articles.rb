class AddImageTwoToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_two, :string
  end
end
