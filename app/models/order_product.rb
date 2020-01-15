class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :amount, presence: true

  monetize :price_cents

  before_save :set_price

  private

  def set_price
    self.price_cents = product.price_cents
  end
end
