class SessionsController < ApplicationController

  def new
  end

  def create
    store = Store.find_by(email: params[:session][:email].downcase)
    if store && store.authenticate(params[:session][:password])
      sign_in_ store
      redirect_to store
    else
      flash.now[:error] = "パスワードとメールアドレスが正しくありません"
      render 'new'
    end
  end

  def destroy
  	store_sign_out
  	redirect_to root_url
  end
end
