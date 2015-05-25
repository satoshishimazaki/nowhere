class AddRecommendToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :recommend, :string, default: "0"
  end
end
