class Product < ApplicationRecord
  belongs_to :unity

  validates :name, :description, :price_cents, :stock, presence: true

  monetize :price_cents
end
