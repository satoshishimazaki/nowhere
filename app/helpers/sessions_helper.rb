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

  def signed_in__store
    unless signed_in_?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end


  def sign_out
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

  def create
    store = Store.find_by(email: params[:session][:email].downcase)
    if store && store.authenticate(params[:session][:password])
      sign_in_ store
      redirect_back_or store
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
