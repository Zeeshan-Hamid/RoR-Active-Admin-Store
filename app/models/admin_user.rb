class AdminUser < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true

  has_many :products, dependent: :destroy

  # Add trackable fields to Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[id email name created_at updated_at sign_in_count current_sign_in_at last_sign_in_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
