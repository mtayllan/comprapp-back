class Address < ApplicationRecord
  belongs_to :user

  validates :street, :district, :number, :city, presence: true
end
