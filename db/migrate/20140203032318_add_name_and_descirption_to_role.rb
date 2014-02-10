class AddNameAndDescirptionToRole < ActiveRecord::Migration
  def change
    add_column :roles, :name, :string
    add_column :roles, :description, :text
  end
end
