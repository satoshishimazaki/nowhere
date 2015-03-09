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
    @articles = current_user.favorite_articles.paginate(page: params[:page]).order( created_at: :desc )
    @article_address = Article.select(:address).limit(15).map{|article| '"'+article.address+'"'}
    render 'users/index'
  end
end
