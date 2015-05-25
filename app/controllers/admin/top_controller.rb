class Admin::TopController < ApplicationController
	before_action :admin_store
	def index
 	end

    private
    def admin_store
      @store = current_store
      if @store.admin == false
      	 redirect_to root_url
      end
    end
end
