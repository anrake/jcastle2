class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

	before_create :assign_role

  	def assign_role
    	# assign a default role if no role is assigned
    	self.add_role :user if self.roles.first.nil?
  	end

end
