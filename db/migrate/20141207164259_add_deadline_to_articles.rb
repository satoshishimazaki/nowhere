class AddDeadlineToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :deadline, :time
  end
end
