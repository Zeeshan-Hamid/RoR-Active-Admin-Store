class Product < ApplicationRecord
    belongs_to :admin_user 
  
    validates :name, presence: true
    validates :name, length: { maximum: 255 }
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :img, presence: true
  end
  