class AddViewCountToArticles < ActiveRecord::Migration
  def change
    change_column_default :articles, :view_count, 0
  end
end
