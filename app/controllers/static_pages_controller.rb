class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def geo
  end

  def sample
  	@articles = Article.all
  	# @articles = Article.where('created_at > ?', Time.now - 24.hours).order( created_at: :desc )
    @time = Time.now
  	render layout: false
  end
  
  def sample_sample
    @article = Article.first
    # render layout: false
  end

  def menu_sample
    # render layout: false
  end
end
