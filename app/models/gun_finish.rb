class GunFinish < ActiveRecord::Base
	validates :name, :length => { :minimum => 3, :maximum => 250, :message => "Please specify the category name." }
	validates :description, :length => { :maximum => 250 }

	has_many :gun_available_finishes, :dependent => :destroy
end
