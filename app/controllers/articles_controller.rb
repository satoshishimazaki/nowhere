class ArticlesController < ApplicationController
  before_action :signed_in_store,  only:[:create, :destroy, :new]

  def new
  	  @article = Article.new
      @article.address = current_store.address
      @article.dead_line = Time.now
      @article.article_images.build
  end

  def show
      @article = Article.find(params[:id])
      @article.view_count = @article.view_count + 1
      @article.save
  end

  def index
      @articles = Article.where('created_at > ?', Time.now - 24.hours).order( created_at: :desc )
      @time = Time.now
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

  def upload
    @image = ArticleImage.create(:article_id => params[:id], :image => params[:article_image][:image])
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
      params.require(:article).permit( :content, :herenowtitle, :title, :image, :address, :latitude, :longitude, :dead_line, article_image_attributes: [:image])
    end
end