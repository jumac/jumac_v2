class GunManufacturer < ActiveRecord::Base
	validates :name, :length => { :minimum => 3, :maximum => 250, :message => "Please specify the category name." }
	validates :description, :length => { :maximum => 250 }
	
	has_many :guns
end
