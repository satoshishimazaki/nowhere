module ArticleHelper
  def profile_image_one_for(article, size = '52')
    image_tag "/docs/#{article.image_one}", size: size, class: :gravatar
  end
  
  def profile_image_two_for(article, size = '52')
    image_tag "/docs/#{article.image_two}", size: size, class: :gravatar
  end
  
  def profile_image_three_for(article, size = '52')
    image_tag "/docs/#{article.image_three}", size: size, class: :gravatar
  end
  
  def profile_image_four_for(article, size = '52')
    image_tag "/docs/#{article.image_four}", size: size, class: :gravatar
  end
  
  def profile_image_five_for(article, size = '52')
    image_tag "/docs/#{article.image_five}", size: size, class: :gravatar
  end
end
