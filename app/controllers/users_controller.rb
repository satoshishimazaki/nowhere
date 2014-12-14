class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def favorite
  	@article = user.articles.build
    @feed_articles = user.favorite_articles.paginate(page: params[:page])
    render template: 'article/index'
  end
end
