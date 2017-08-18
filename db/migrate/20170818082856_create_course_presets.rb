class CreateCoursePresets < ActiveRecord::Migration[5.1]
  def change
    create_table :course_presets do |t|
      t.string :name
      t.text :description
      t.references :school, foreign_key: true
      t.timestamps
    end
  end
end
