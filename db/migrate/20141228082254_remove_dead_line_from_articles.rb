class RemoveDeadLineFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :dead_line, :datetime
  end
end
