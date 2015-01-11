json.array!(@inquiries) do |inquiry|
  json.extract! inquiry, :name, :email, :content
  json.url inquiry_url(inquiry, format: :json)
end