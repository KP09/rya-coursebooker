class CreateAdminProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_profiles do |t|
      t.references :user, foreign_key: true
      t.references :school, foreign_key: true
      t.timestamps
    end
  end
end
