class AddImageFourToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_four, :string
  end
end
