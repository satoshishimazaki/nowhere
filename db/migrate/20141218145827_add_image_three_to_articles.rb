class AddImageThreeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_three, :string
  end
end
