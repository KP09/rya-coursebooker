class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.references :school, foreign_key: true
      t.references :course_preset, foreign_key: true
      t.references :course_location, foreign_key: true
      t.float :price
      t.date :start_date
      t.date :end_date
      t.integer :spaces
      t.timestamps
    end
  end
end
