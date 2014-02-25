class CreateGuns < ActiveRecord::Migration
  def change
    create_table :guns do |t|
      t.string :model_name
      t.string :short_desc
      t.text :long_desc
      t.integer :gun_category_id
      t.integer :gun_manufacturer_id
      t.integer :round_capacity

      t.timestamps   
    end
  end
end
