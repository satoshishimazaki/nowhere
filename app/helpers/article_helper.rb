module ArticleHelper
  def article_image_for(image_name, option = {})
    if image_name
     image_tag "/docs/#{image_name}", :height =>'320', :align => 'top'
    else
     image_tag "noimage.gif", :height =>'320', :align => 'top'
    end
  end

  # def time_valid
  #   @articles = Article.all
  #   @articles = Article.where('created_at > ?', Time.now - 24.hours).order( created_at: :desc )
  # end
end
