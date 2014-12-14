class ArticleImagesController < ApplicationController
  def edit
    @image = ArticleImage.new
  end

  def upload
    @image = ArticleImage.create({
        :article_id => params[:id], # member_id
        :image => params[:article_image][:image]
    })
  end
end
