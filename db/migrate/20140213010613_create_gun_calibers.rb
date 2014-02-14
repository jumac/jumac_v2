class CreateGunCalibers < ActiveRecord::Migration
  def change
    create_table :gun_calibers do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
