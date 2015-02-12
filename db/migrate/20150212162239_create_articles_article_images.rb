class CreateArticlesArticleImages < ActiveRecord::Migration
  def remove
    create_table :articles_article_images, id: false do |t|
      t.references :article, index: true, null: false
      t.references :article_image, index: true, null: false
    end
  end
end
