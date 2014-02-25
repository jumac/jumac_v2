class CreateGunFinishes < ActiveRecord::Migration
  def change
    create_table :gun_finishes do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
