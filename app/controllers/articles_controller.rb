class ArticlesController < ApplicationController
  before_action :signed_in_store,  only:[:create, :destroy, :new, :edit, :update]
  # before_action :time_valid, only:[:ajax_index]
  impressionist actions: [:show, :index, :index_eating, :index_shopping, :index_station, :index_other]

  def new
  	  @article = Article.new
      @article.article_images.build
      @article.address = current_store.address
      @article.category = current_store.category
      @article.station = current_store.station
  end

  def show
      @article = Article.find(params[:id])
      @article.view_count = @article.view_count + 1
      @article.save
      @hash = Gmaps4rails.build_markers(@article) do |article, marker|
        marker.lat article.latitude          
        marker.lng article.longitude
        marker.infowindow  "<a href='http://maps.google.com/maps?ll=#{article.latitude},#{article.longitude}&daddr=#{article.latitude},#{article.longitude}', target=blank >"'行き方'"</a>"
        # marker.json({title: article.title, herenowtitle: article.herenowtitle})
      end
      @articles = Article.all.where(store_id: @article.store.id).order( created_at: :desc )
      # signed_in? do
      #  @user = User.find(params[:user_id])
      # end
      # @comments = @article.comments.all
      # @article.comments.build
      # raise
      # @comment = Comment.new
      # @comment.user_name = current_user.name
      # # raise
  end

  def index
      @articles = Article.all
      @articles = Article.where('created_at > ?', Time.now - 24*14.hours).order( created_at: :desc )
      @article_address = Article.select(:address).order(created_at: :desc).limit(15).map{|article| '"'+article.address+'"'}
      @time = Time.now
      # raise
      render layout: 'index'
      # @articles = Article.paginate(page: params[:page])
      @users = User.all
  end

  def index_gmap
      @articles = Article.all
      @articles = Article.where('created_at > ?', Time.now - 24*14.hours)
      @hash = Gmaps4rails.build_markers(@articles) do |article, marker|
        marker.lat article.latitude          
        marker.lng article.longitude
        marker.infowindow "<a href='/articles/#{article.id}/'>"+article.store.station+":"+article.title[0..10]+"</a><br>"+article.store.name+'<br>'+"<a href='http://maps.google.com/maps?ll=#{article.latitude},#{article.longitude}&daddr=#{article.latitude},#{article.longitude}', target=blank >"'経路'"'</a><br>"+"<a href='/articles/#{article.id}/'><img  height='30' width='30' src='/docs/#{article.article_images.map{|articleimage| articleimage.image }.first}'></a>"
        # marker.picture "#sample5_app/public/docs/ショコラ.jpg"
        # marker.json({title: article.title})
      end 
      # @articles.each do |article|
      #   article.address
      # end  
      # raise
      @articles = Article.all
      @articles = Article.where('created_at > ?', Time.now - 24*14.hours).order( created_at: :desc )
      @article_address = Article.select(:address).limit(15).map{|article| '"'+article.address+'"'}
      @time = Time.now
  end

  def index_eating
      @articles = Article.all
      @articles = Article.where('created_at > ? AND category = ?', Time.now - 24*14.hours, '飲食').order( created_at: :desc )
      # raise
  end

  def index_shopping
      @articles = Article.all
      @articles = Article.where('created_at > ? AND category = ?', Time.now - 24*14.hours, 'shopping').order( created_at: :desc )
  end

  def index_other
      # @articles = 'nil'
      @articles = Article.all
      @articles = Article.where('created_at > ? AND category = ?', Time.now - 24*14.hours, 'その他').order( created_at: :desc )
      # raise 
  end

  def index_station
      @articles = Article.all
      @articles = Article.where('created_at > ? AND station = ?', Time.now - 24*14.hours, params[:station]).order( created_at: :desc )
      @article_address = Article.select(:address).limit(15).map{|article| '"'+article.address+'"'}
  end

  def create
  	  @article = current_store.articles.build(article_params)
      # @article.article_images.build
      # file1 = params[:article][:image_one]
      # file2 = params[:article][:image_two]
      # file3 = params[:article][:image_three]
      # file4 = params[:article][:image_four]
      # file5 = params[:article][:image_five]
      # @article.set_image_one(file1)
      # @article.set_image_two(file2)
      # @article.set_image_three(file3)
      # @article.set_image_four(file4)
      # @article.set_image_five(file5)
    if @article.save
      # flash[:success] = "投稿完了!"
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
    @articles = @articles.where('created_at > ?', Time.now - 24*14.hours).order( created_at: :desc )
    # @article_address = Article.select(:address).order(created_at: :desc).limit(15).map{|article| '"'+article.address+'"'}
    # @articles = @stores.map { |store| store.articles }.map { |articles| articles }.map { |article| article }
    # logger.debug(@articles)
  end

  #1mile抽出
  def ajax_mile
    # ユーザーの現在地から近い順にStoresをとってくる
    article = Article.within_box(distance: 1, latitude: params[:latitude], longitude: params[:longitude])
    @articles = Article.by_distance(origin: article)
    @articles = @articles.where('created_at > ?', Time.now - 24*14.hours).order( created_at: :desc )
    # @article_address = Article.select(:address).order(created_at: :desc).limit(15).map{|article| '"'+article.address+'"'}
    # @articles = @stores.map { |store| store.articles }.map { |articles| articles }.map { |article| article }
    # logger.debug(@articles)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
      # file1 = params[:article][:image_one]
      # file2 = params[:article][:image_two]
      # file3 = params[:article][:image_three]
      # file4 = params[:article][:image_four]
      # file5 = params[:article][:image_five]
      # @article.set_image_one(file1)
      # @article.set_image_two(file2)
      # @article.set_image_three(file3)
      # @article.set_image_four(file4)
      # @article.set_image_five(file5)
    if @article.update_attributes(article_params)
       # flash[:success] = "Article updated"
       redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

    def article_params
      params.require(:article).permit( :content, :title, :station, :address, :latitude, :longitude, :category, :body, :user_name, article_images_attributes: [:image])
    end
end