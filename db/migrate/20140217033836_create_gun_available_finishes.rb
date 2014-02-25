class CreateGunAvailableFinishes < ActiveRecord::Migration
  def change
    create_table :gun_available_finishes do |t|
      t.integer :gun_id
      t.integer :gun_finish_id

      t.timestamps
    end
  end
end
