class Product < ApplicationRecord
  belongs_to :unity
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products

  validates :name, :description, :price_cents, :stock, presence: true

  monetize :price_cents
end
