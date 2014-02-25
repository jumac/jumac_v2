class GunAvailableFinish < ActiveRecord::Base
	belongs_to :gun
	belongs_to :gun_finish
end
