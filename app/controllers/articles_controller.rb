class ArticlesController < ApplicationController
  before_action :signed_in__store,  only:[:create, :destroy, :new]

  def new
  	  @article = Article.new
      @article.address = current_store.address
  end

  def show
      @article = Article.find(params[:id])
  end

  def index
      @articles = Article.all.order( created_at: :desc )
  end

  def create
  	  @article = current_store.articles.build(article_params)
    if @article.save
      flash[:success] = "投稿完了!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def ajax_index
    # ユーザーの現在地から近い順にStoresをとってくる
    article = Article.new(latitude: params[:latitude], longitude: params[:longitude])
    @articles = Article.by_distance(origin: article)
    # @articles = @stores.map { |store| store.articles }.map { |articles| articles }.map { |article| article }
    # logger.debug(@articles)
  end

  def destroy
  end

  private

    def article_params
      params.require(:article).permit( :content, :herenowtitle, :title, :image, :address, :latitude, :longitude)
    end
end