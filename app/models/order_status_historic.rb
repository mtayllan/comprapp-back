class OrderStatusHistoric < ApplicationRecord
  belongs_to :order

  validates :status, presence: true

  enum status: { creating: 0, pending: 1, en_route: 2, delivered: 3, canceled: 4 }
end
