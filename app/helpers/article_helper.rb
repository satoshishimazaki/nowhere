module ArticleHelper
  def article_image_for(image_name, option = {})
    if image_name
     image_tag "/docs/#{image_name}", :align => 'top'
    else
     image_tag "no_image.png", :align => 'top'
    end
  end

# 　def new_image_for(image_name, option = {})
#     image_tag "icn_new_png", :height =>'50'
#   end
  # def time_valid
  #   @articles = Article.all
  #   @articles = Article.where('created_at > ?', Time.now - 24.hours).order( created_at: :desc )
  # end
end