class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def favorite
  	# @article = current_user.articles.build
    @articles = current_user.favorite_articles.paginate(page: params[:page])
    render 'articles/index'
  end
end
