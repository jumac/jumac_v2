class AddRoundCapacityToGunAvailableCaliber < ActiveRecord::Migration
  def change
    add_column :gun_available_calibers, :round_capacity, :integer
  end
end
