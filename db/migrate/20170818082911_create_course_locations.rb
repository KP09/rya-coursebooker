class CreateCourseLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :course_locations do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.references :school, foreign_key: true
      t.timestamps
    end
  end
end
