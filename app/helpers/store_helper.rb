module StoreHelper
  def profile_image_for(image_name, option = {})
    if image_name
     image_tag "/docs/#{image_name}", :align => 'top', :id => "profile"
    else
     image_tag "no_image.png", :align => 'top'
    end
  end

  def show_profile_image_for(image_name, option = {})
    if image_name
     image_tag "/docs/#{image_name}", :align => 'top', :id => "showprofile"
    else
     image_tag "no_image.png", :align => 'top'
    end
  end
end