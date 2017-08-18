class CoursePreset < ApplicationRecord
  # Associations
  belongs_to :school
  has_many :courses
end
