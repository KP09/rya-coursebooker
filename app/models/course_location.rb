class CourseLocation < ApplicationRecord
  # Associations
  belongs_to :school
  has_many :courses

  # Validations
  validates :name, presence: true
  validates :description, presence: true
end
