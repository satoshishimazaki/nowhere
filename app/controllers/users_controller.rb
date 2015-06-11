class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show]
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

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   raise 
  #   # @store = Store.new
  #   # @store.name = params[:store][:name]
  #   # @store.profile = params[:store][:profile]
  #   if @user.save
  #     sign_in__ @user
  #     # flash[:success] = "Welcome to the BeansStreet!"
  #   #   redirect_to "root_path"
  #   # else
  #   #   render 'new'
  #   end
  # end

  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    # def user_params
    #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
    # end
end
