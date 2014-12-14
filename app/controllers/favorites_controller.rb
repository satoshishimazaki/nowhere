class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    current_user.favorite!(@article)
  end

  def destroy
    @article = Favorite.find(params[:id]).article
    current_user.unfavorite!(@article)
  end
end