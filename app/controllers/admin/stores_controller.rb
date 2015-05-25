class Admin::StoresController < ApplicationController
  
  def show
    @store = Store.find(params[:id])
    # @articles = @store.articles
    @articles = @store.articles.paginate(page: params[:page]).order( created_at: :desc )
    correcting_store
  end

  def new
    @store = Store.new
  end

  def index
    @stores = Store.all
  end
  
  # def index_eat
  #   @articles = Article.joins(:store).where!('stores.category'=> '飲食')
  #   # @articles = @articles.where!('created_at > ?', Time.now - 24.hours).order( created_at: :desc )
  #   @time = Time.now
  #   # #@stores = Store.find_by(category: '飲食')
  #   #@articles = @stores.articles
  # end

  # def index_shopping
  #   @articles = Article.joins(:store).where('stores.category'=> 'shopping')
  #   # @articles = Article.where('created_at > ?', Time.now - 24.hours).order( created_at: :desc )
  #   # @time = Time.now
  #   # #@stores = Store.find_by(category: 'shopping')
  #   #@articles = @stores.articles
  # end

  def create
    @store = Store.new(store_params)
    # @store = Store.new
    # @store.name = params[:store][:name]
    # @store.profile = params[:store][:profile]
    file1 = params[:store][:profile]
    @store.set_image(file1)
    if @store.save
      sign_in_ @store
      # flash[:success] = "Welcome to the BeansStreet!"
      redirect_to @store
    else
      render 'new'
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    file1 = params[:store][:profile]
    @store.set_image(file1)
    if @store.update(store_params)
       # flash[:success] = "Profile updated"
       redirect_to @store
    else
      render 'edit'
    end
  end

  def destroy
    Store.find(params[:id]).destroy
    # flash[:success] = "Store destroyed."
    redirect_to stores_url
  end

  def search_store
    @store = Store.find(params[:id])
    @articles = @store.articles.paginate(page: params[:page]).order( created_at: :desc )
  end

  private

    def store_params
      params.require(:store).permit(:name, :email, :tel, :url, :password, :password_confirmation, :category, :address, :url_sec, :address_sec, :station, :managetime, :holiday)
    end

    # Before actions
    def correct_store
      @store = Store.find(params[:id])
      redirect_to(root_path) unless current_store?(@store)
    end

    def admin_store
      redirect_to(root_path) unless current_store.admin?
    end
end
