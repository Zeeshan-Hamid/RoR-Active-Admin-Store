class AdminUser < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true

  # One-to-many relationship with products
  has_many :products, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[id email name created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
