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
  # def get_distance(lat1, lng1, lat2, lng2)
  #   y1 = lat1 * Math::PI / 180
  #   x1 = lng2 * Math::PI / 180
  #   y2 = lat2 * Math::PI / 180
  #   x2 = lng2 * Math::PI / 180
  #   earth_r = 6378140
      
  #   deg = Math::sin(y1) * Math::sin(y2) + Math::cos(y1) * Math::cos(y2) * Math::cos(x2 - x1)
  #   distance = earth_r * (Math::atan(-deg / Math::sqrt(-deg * deg + 1)) + Math::PI / 2) / 1000
  # end
  
  # #距離表記が浮動小数点が整数に変換しなかったので作成
  # def to_i! (x)
  #   x.to_i
  # end
end