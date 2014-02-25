class User < ActiveRecord::Base
	validates :username, :presence => true, :length => {:minimum => 3}, :uniqueness => true
	validates :email, :presence => true, :uniqueness => true
	validate :email_regex
 
	has_secure_password

	has_one :user_profile, :dependent => :destroy
	accepts_nested_attributes_for :user_profile

	has_many :user_roles, :dependent => :destroy
	has_many :roles, through: :user_roles
	accepts_nested_attributes_for :roles

	def email_regex
    if email.present? and not email.match(/^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i)
      errors.add :email, "This is not a valid email format"
    end

    def is_in_role(rolename)
    	
    end
  end
end
