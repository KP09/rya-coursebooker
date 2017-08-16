class User < ApplicationRecord
  # Associations
  has_many :bookings

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

end
