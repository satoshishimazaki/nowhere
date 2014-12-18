class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def geo
  end

  def sample
  	render layout: false
  end
end
