class AddImageFiveToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_five, :string
  end
end
