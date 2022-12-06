class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :orders
  has_many :reviews, dependent: :destroy
  has_one :address

  validates :name, presence: true, length: { in: 2..100 }
  validates :email, presence: true, length: { in: 5..100 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :phone, presence: false, length: { in: 10..16 }, format: { with: /\A[\d\s-]+\z/ }, allow_blank: true
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
