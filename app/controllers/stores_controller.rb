class StoresController < ApplicationController
  before_action :signed_in_store, only: [:edit, :update, :destroy]
  before_action :correct_store,   only: [:edit, :update]
  before_action :admin_store,     only: :destroy

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      flash[:success] = "Welcome to the BeansStreet!"
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
    if @store.update_attributes(store_params)
       flash[:success] = "Profile updated"
       redirect_to @store
    else
      render 'edit'
    end
  end

  def destroy
    Store.find(params[:id]).destroy
    flash[:success] = "Store destroyed."
    redirect_to stores_url
  end

  private

    def store_params
      params.require(:store).permit(:name, :email, :tel, :url, :password, :password_confirmation)
    end

    # Before actions

    def signed_in_store
      unless signed_in?
       store_location
       redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_store
      @store = Store.find(params[:id])
      redirect_to(root_path) unless current_store?(@store)
    end

    def admin_store
      redirect_to(root_path) unless current_store.admin?
    end
end