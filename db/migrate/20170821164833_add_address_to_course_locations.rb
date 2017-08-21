class AddAddressToCourseLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :course_locations, :address, :string
  end
end
