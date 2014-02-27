class AddIsAvailableToGunAvailableCaliber < ActiveRecord::Migration
  def change
    add_column :gun_available_calibers, :is_available, :boolean
  end
end
