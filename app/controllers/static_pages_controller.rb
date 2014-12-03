class StaticPagesController < ApplicationController
  def home
  	@articles = Article.all.order(created_at: :desc)
  end

  def about
  end

  def geo
  end
end
