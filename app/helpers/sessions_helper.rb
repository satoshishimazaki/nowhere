module SessionsHelper

  def sign_in(store)
    remember_token = Store.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    store.update_attribute(:remember_token, Store.encrypt(remember_token))
    self.current_store = store
  end
  
  def signed_in?
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

  def signed_in_store
    unless signed_in?
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def sign_out
    self.current_store = nil
    cookies.delete(:remember_token)
  end
end
