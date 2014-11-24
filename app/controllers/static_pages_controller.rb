class StaticPagesController < ApplicationController
  def home
  	@articles = Article.all
  	@store = Store.new(latitude: params[:latitude], longitude: params[:longitude])
  end

  def about
  end
end
