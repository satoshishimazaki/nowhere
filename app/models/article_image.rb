class ArticleImage < ActiveRecord::Base
  belongs_to :article
  # has_and_belongs_to_many :articles
  has_and_belongs_to_many :users

  def image=(image)
    if !image.nil?
       file_name = image.original_filename + Time.now.to_s
       File.open("public/docs/#{file_name}", 'wb'){|f| f.write(image.read)}
       write_attribute(:image, file_name)
    end
  end


  # def set_image_one(file1)
  #   if !file1.nil?
  #      file_name = file1.original_filename + Time.now.to_s
  #      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file1.read)}
  #      self.image_one = file_name
  #   end
  # end

  # def set_image_two(file2)
  #   if !file2.nil?
  #      file_name = file2.original_filename + Time.now.to_s
  #      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file2.read)}
  #      self.image_two = file_name
  #   end
  # end
  
  # def set_image_three(file3)
  #   if !file3.nil?
  #      file_name = file3.original_filename + Time.now.to_s
  #      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file3.read)}
  #      self.image_three = file_name
  #   end
  # end

  # def set_image_four(file4)
  #   if !file4.nil?
  #      file_name = file4.original_filename + Time.now.to_s
  #      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file4.read)}
  #      self.image_four = file_name
  #   end
  # end

  # def set_image_five(file5)
  #   if !file5.nil?
  #      file_name = file5.original_filename + Time.now.to_s
  #      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file5.read)}
  #      self.image_five = file_name
  #   end
  # end
  
  # def set_image_five(file6)
  #   if !file6.nil?
  #      file_name = file5.original_filename + Time.now.to_s
  #      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file5.read)}
  #      self.image_five = file_name
  #   end
  # end 
end
