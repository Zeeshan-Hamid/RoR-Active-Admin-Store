class AddImageToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :img, :text
  end
end
