class User < ApplicationRecord
  # Associations
  has_one :customer_profile
  has_one :admin_profile
  has_many :bookings

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

  # Devise
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
