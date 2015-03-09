class AddDeadLineToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :dead_line, :datetime
  end
end
