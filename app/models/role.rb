class Role < ActiveRecord::Base
	validates :name, :length => { :minimum => 3, :maximum => 250 }
	validates :description, :length => { :maximum => 250 }

	has_many :user_roles, :dependent => :destroy
end
