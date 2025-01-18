# app/admin/products.rb
ActiveAdmin.register Product do
    permit_params :name, :price, :img, :description, :admin_user_id
  
    index do
      selectable_column
      id_column
      column :name
      column :price
      column :created_at
      column :updated_at
      actions
    end
  
    filter :name
    filter :price
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :price
        f.input :img
        f.input :description
        
        f.input :admin_user_id, as: :select, collection: AdminUser.all.pluck(:name, :id), include_blank: false
      end
      f.actions
    end
  end
  