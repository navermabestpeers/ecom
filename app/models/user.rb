class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :orders
  has_one :address
  has_many :reviews, dependent: :destroy
  
  accepts_nested_attributes_for :address
         
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:buyer) if self.roles.blank?
  end

end
