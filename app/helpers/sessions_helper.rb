module SessionsHelper

  def sign_in_(store)
    remember_token = Store.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    store.update_attribute(:remember_token, Store.encrypt(remember_token))
    self.current_store = store
  end
  
  def signed_in_?
    !current_store.nil?
  end

  # def signed_in?
  #   !current_user.nil?
  # end

  def current_store=(store)
    @current_store = store
  end

  def current_store
    remember_token = Store.encrypt(cookies[:remember_token])
    @current_store ||= Store.find_by(remember_token: remember_token)
  end

  def current_store?(store)
    store == current_store
  end

  def signed_in_store
    unless signed_in_?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end


  def store_sign_out
    self.current_store = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

  def correcting_store
      @store = Store.find(params[:id])
      current_store?(@store)
  end

  # def create
  #   store = Store.find_by(email: params[:session][:email].downcase)
  #   if store && store.authenticate(params[:session][:password])
  #     sign_in_ store
  #     redirect_back_or store
  #   else
  #     flash.now[:error] = 'パスワードとメールアドレスが正しくありません'
  #     render 'new'
  #   end
  # end

  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

end
