class CreateCustomerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_profiles do |t|
      t.references :user, foreign_key: true
      t.string :phone_number
      t.timestamps
    end
  end
end
