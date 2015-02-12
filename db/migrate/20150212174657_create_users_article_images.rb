class CreateUsersArticleImages < ActiveRecord::Migration
  def change
    create_table :users_article_images, id: false do |t|
      t.references :user, index: true, null: false
      t.references :article_image, index: true, null: false
    end
  end
end
 