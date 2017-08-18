class School < ApplicationRecord
  # Associations
  has_many :admin_profiles
  has_many :courses
  has_many :course_presets
  has_many :course_locations

  # Validations
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :website_url, presence: true
end
