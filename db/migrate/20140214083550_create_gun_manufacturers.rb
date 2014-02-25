class CreateGunManufacturers < ActiveRecord::Migration
  def change
    create_table :gun_manufacturers do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
