class AddStationToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :station, :string
  end
end
