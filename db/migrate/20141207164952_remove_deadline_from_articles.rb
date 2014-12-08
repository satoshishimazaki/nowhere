class RemoveDeadlineFromArticles < ActiveRecord::Migration
  def change
  	remove_column :articles, :deadline
  end
end
