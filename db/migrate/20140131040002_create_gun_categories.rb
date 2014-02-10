class CreateGunCategories < ActiveRecord::Migration
  def change
    create_table :gun_categories do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
