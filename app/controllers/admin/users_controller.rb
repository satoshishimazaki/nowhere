class Admin::UsersController < ApplicationController
	before_action :admin_store
	def index
		@users = User.all
 	end
 	def show
 		@user = User.find(params[:id])
 	end

 	private
    def admin_store
      @store = current_store
      if @store.admin == false
      	 redirect_to root_url
      end
    end
end