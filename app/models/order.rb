class Order < ApplicationRecord
  belongs_to :user

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  has_many :order_status_historics, dependent: :destroy

  validates :status, presence: true

  enum status: { creating: 0, pending: 1, en_route: 2, delivered: 3, canceled: 4 }

  before_save :compose_history

  private

  def compose_history
    order_status_historics << OrderStatusHistoric.new(status: status) if !id || Order.find(id).status != status
  end
end
