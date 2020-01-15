class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :addresses, dependent: :destroy

  rolify # customer || admin

  after_create :assign_default_role

  private

  def assign_default_role
    add_role(:customer) if roles.blank?
  end
end
