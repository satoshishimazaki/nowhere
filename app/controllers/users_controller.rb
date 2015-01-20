class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def favorite
  	@article = current_user.articles.build
    @feed_articles = current_user.favorite_articles.paginate(page: params[:page])
  　render template: 'article/index'
  end
end
