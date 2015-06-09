class Users::SessionsController < Devise::SessionsController
  def new
    super
  end
 
  def create
    super
    sign_in__ user
  end
end