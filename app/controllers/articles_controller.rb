class ArticlesController < ApplicationController
  before_action :signed_in_store,  only:[:create, :destroy, :new, :edit, :update]
  # before_action :time_valid, only:[:ajax_index]

  def new
  	  @article = Article.new
      @article.address = current_store.address
  end

  def show
      @article = Article.find(params[:id])
      @article.view_count = @article.view_count + 1
      @article.save
  end

  def index
      @articles = Article.all
      @articles = Article.where('created_at > ?', Time.now - 24.hours).order( created_at: :desc )
      @time = Time.now
      # @articles = Article.paginate(page: params[:page])
  end

  def create
  	  @article = current_store.articles.build(article_params)
      file1 = params[:article][:image_one]
      file2 = params[:article][:image_two]
      file3 = params[:article][:image_three]
      file4 = params[:article][:image_four]
      file5 = params[:article][:image_five]
      @article.set_image_one(file1)
      @article.set_image_two(file2)
      @article.set_image_three(file3)
      @article.set_image_four(file4)
      @article.set_image_five(file5)
    if @article.save
      flash[:success] = "投稿完了!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  # def upload
  #   @image = ArticleImage.create(:article_id => params[:id], :image => params[:article_image][:image])
  # end

  def ajax_index
    # ユーザーの現在地から近い順にStoresをとってくる
    article = Article.new(latitude: params[:latitude], longitude: params[:longitude])
    @articles = Article.by_distance(origin: article)
    @articles = @articles.where('created_at > ?', Time.now - 24.hours).order( created_at: :desc )
    # @articles = @stores.map { |store| store.articles }.map { |articles| articles }.map { |article| article }
    # logger.debug(@articles)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
      file1 = params[:article][:image_one]
      file2 = params[:article][:image_two]
      file3 = params[:article][:image_three]
      file4 = params[:article][:image_four]
      file5 = params[:article][:image_five]
      @article.set_image_one(file1)
      @article.set_image_two(file2)
      @article.set_image_three(file3)
      @article.set_image_four(file4)
      @article.set_image_five(file5)
    if @article.update_attributes(article_params)
       flash[:success] = "Article updated"
       redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

    def article_params
      params.require(:article).permit( :content, :herenowtitle, :title, :address, :latitude, :longitude)
    end
end