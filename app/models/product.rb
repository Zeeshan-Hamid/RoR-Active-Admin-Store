class Product < ApplicationRecord
    belongs_to :admin_user  
    has_many :cart_items
    validates :name, presence: true
    validates :name, length: { maximum: 255 }
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :img, presence: true
  
  
    def self.ransackable_attributes(auth_object = nil)
      ["name", "price", "img", "description", "created_at", "updated_at"]
    end
  end


  
  