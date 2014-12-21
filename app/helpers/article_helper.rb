module ArticleHelper
  def article_image_for(image_name, option = {})
    image_tag "/docs/#{image_name}", option
  end
end
