class AdminProfile < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :school
end
