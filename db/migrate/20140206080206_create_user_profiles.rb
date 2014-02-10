class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :mobile_no
      t.string :land_line
      t.string :address1
      t.string :address2
      t.string :city

      t.timestamps
    end
  end
end
