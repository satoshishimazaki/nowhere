module ApplicationHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title)
    base_title = "now here"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def phone_number_link(text)
    sets_of_numbers = text.scan(/[0-9]+/)
    number = "+81-#{sets_of_numbers.join('-')}"
    link_to text, "tel:#{number}"
  end
 end