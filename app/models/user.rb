class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :orders
  has_many :reviews, dependent: :destroy
  has_one :address  
  accepts_nested_attributes_for :address
         
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:buyer) if self.roles.blank?
  end

  def with_address
    build_address if address.nil?
    self
  end
  
end
