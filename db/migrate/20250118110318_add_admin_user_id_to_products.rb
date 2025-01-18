class AddAdminUserIdToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :admin_user_id, :integer
  end
end
