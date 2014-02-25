class RemoveRoundCapacityFromGuns < ActiveRecord::Migration
  def change
    remove_column :guns, :round_capacity, :integer
  end
end
