class Course < ApplicationRecord
  # Associations
  belongs_to :school
  belongs_to :course_preset
  belongs_to :course_location
  has_many :bookings
end
