class AddColumnToArticleImage < ActiveRecord::Migration
  def change
    add_column :article_images, :image_one, :string
    add_column :article_images, :image_two, :string
    add_column :article_images, :image_three, :string
    add_column :article_images, :image_four, :string
    add_column :article_images, :image_five, :string
    add_column :article_images, :image_six, :string
  end
end
