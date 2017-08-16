class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.text :description
      t.string :phone_number
      t.string :website_url

      t.timestamps
    end
  end
end
