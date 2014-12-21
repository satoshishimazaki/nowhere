module ApplicationHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title)
    base_title = "BeansStreet"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def article_image_for(image_name, option = {})
    image_tag "/docs/#{image_name}", option
  end
 end