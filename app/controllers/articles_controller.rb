class ArticlesController < ApplicationController
  before_action :signed_in_store,  only:[:create, :destroy, :new, :edit, :update]
  # before_action :time_valid, only:[:ajax_index]

  def new
  	  @article = Article.new
      @article.article_images.build
      @article.address = current_store.address
      @article.category = current_store.category
  end

  def show
      @article = Article.find(params[:id])
      @article.view_count = @article.view_count + 1
      @article.save
      @hash = Gmaps4rails.build_markers(@article) do |article, marker|
        marker.lat article.latitude          
        marker.lng article.longitude
        marker.infowindow  "<a href='/articles/#{article.id}/'>"'<h3>'+article.title+"</h3></a><hr><br>"+"<a href='http://maps.google.com/maps?ll=#{article.latitude},#{article.longitude}&daddr=#{article.latitude},#{article.longitude}', target=blank >"'map'"</a>"+article.content
        # marker.json({title: article.title, herenowtitle: article.herenowtitle})
      end
      @articles = Article.all.where(store_id: @article.store.id).order( created_at: :desc )
  end

  def index
      @articles = Article.all
      @articles = Article.where('created_at > ?', Time.now - 24*7.hours).order( created_at: :desc )
      @article_address = Article.select(:address).order(created_at: :desc).limit(15).map{|article| '"'+article.address+'"'}
      @time = Time.now
      # @articles = Article.paginate(page: params[:page])
  end

  def index_gmap
      @articles = Article.all
      @articles = Article.where('created_at > ?', Time.now - 24*7.hours).order( created_at: :desc )
      @hash = Gmaps4rails.build_markers(@articles) do |article, marker|
        marker.lat article.latitude          
        marker.lng article.longitude
        marker.infowindow "<a href='/articles/#{article.id}/'>"'<p5>'+article.herenowtitle+":"+article.title+"</p5></a><br>"+article.store.name+'<br>'+"<a href='http://maps.google.com/maps?ll=#{article.latitude},#{article.longitude}&daddr=#{article.latitude},#{article.longitude}', target=blank >"'経路'"'</a><br>"+"<img  height='30' width='30' src='/docs/#{article.article_images.map{|articleimage| articleimage.image }.first}'>"
        # marker.picture "#sample5_app/public/docs/ショコラ.jpg"
        # marker.json({title: article.title})
      end 
      # @articles.each do |article|
      #   article.address
      # end  
      @article_address = Article.select(:address).limit(15).map{|article| '"'+article.address+'"'}
      @time = Time.now
  end

  def index_eating
      @articles = Article.all
      @articles = Article.where('created_at > ? AND category = ?', Time.now - 24*7.hours, '飲食').order( created_at: :desc )
  end

  def index_shopping
      @articles = Article.all
      @articles = Article.where('created_at > ? AND category = ?', Time.now - 24*7.hours, 'shopping').order( created_at: :desc )
  end

  def index_other
      @articles = Article.all
      @articles = Article.where('created_at > ? AND category = ?', Time.now - 24*7.hours, 'その他').order( created_at: :desc )
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
    @articles = @articles.where('created_at > ?', Time.now - 24*7.hours).order( created_at: :desc )
    # @article_address = Article.select(:address).order(created_at: :desc).limit(15).map{|article| '"'+article.address+'"'}
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
      params.require(:article).permit( :content, :herenowtitle, :title, :address, :latitude, :longitude, :category, article_images_attributes: [:image])
    end
end