class School < ApplicationRecord
  # Associations
  has_many :school_admins
  has_many :courses
  has_many :course_presets
  has_many :location_presets

  # Validations
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :website_url, presence: true
end
