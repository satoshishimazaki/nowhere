class SearchController < ApplicationController
  def index
  	@search_word = params[:word]
  	@stores = Store.where(['name LIKE ?', "%#{@search_word}%"]).paginate(page: params[:page])
  	@stores = Store.where(['category LIKE ?', "%#{@search_word}%"]).paginate(page: params[:page])
    @articles = Article.where(['title LIKE ?', "%#{@search_word}%"]).paginate(page: params[:page])
    @articles = Article.where(['herenowtitle LIKE ?', "%#{@search_word}%"]).paginate(page: params[:page])
    @articles = Article.where(['content LIKE ?', "%#{@search_word}%"]).paginate(page: params[:page])
    @users = User.where(['address LIKE ?', "%#{@search_word}%"]).paginate(page: params[:page])
  end
end
