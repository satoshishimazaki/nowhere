class SpotsController < ApplicationController
  def index
    @lat = params[:lat]
    @lng = params[:lng]
  end
end
