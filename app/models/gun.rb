class Gun < ActiveRecord::Base
	validates :model_name, :presence => true, :length => {:minimum => 3}, :uniqueness => true

	belongs_to :gun_category
	belongs_to :gun_manufacturer

	has_many :gun_available_calibers, :dependent => :destroy
	accepts_nested_attributes_for :gun_available_calibers

	has_many :gun_available_finishes, :dependent => :destroy
	has_many :gun_finishes, through: :gun_available_finishes	
	accepts_nested_attributes_for :gun_finishes

	
end
