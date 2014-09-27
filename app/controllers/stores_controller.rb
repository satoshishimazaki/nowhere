class StoresController < ApplicationController

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

  private

    def store_params
      params.require(:store).permit(:name, :email, :tel, :url, :password, :password_confirmation)
    end
end