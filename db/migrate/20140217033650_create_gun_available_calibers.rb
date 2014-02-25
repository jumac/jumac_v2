class CreateGunAvailableCalibers < ActiveRecord::Migration
  def change
    create_table :gun_available_calibers do |t|
      t.integer :gun_id
      t.integer :gun_caliber_id

      t.timestamps
    end
  end
end
