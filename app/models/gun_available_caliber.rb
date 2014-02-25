class GunAvailableCaliber < ActiveRecord::Base
	belongs_to :gun
	belongs_to :gun_caliber
end
