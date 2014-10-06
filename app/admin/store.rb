ActiveAdmin.register Store do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  
  permit_params :name, :email, :tel, :url, :category

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :tel
    column :url
    column :category
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    default_actions
  end

  filter :name
  filter :email
  filter :tel
  filter :url
  filter :category
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :email
      f.input :tel
      f.input :url
      f.input :category
    end
    f.actions
  end
end
