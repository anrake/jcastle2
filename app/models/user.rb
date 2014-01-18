class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

	before_create :assign_role

  def assign_role
   	# assign a default role if no role is assigned
   	self.add_role :user if self.roles.first.nil?
  end

	def self.find_for_facebook_oauth(auth)
    user = User.where(:email => auth.info.email).first()

    if user
      user = User.where(:email => auth.info.email).first()
      user.uid = auth.uid
      user.provider = auth.provider
      user
    else
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    	user.provider = auth.provider
    	user.uid = auth.uid
    	user.email = auth.info.email
    	user.password = Devise.friendly_token[0,20]
    	user.name = auth.info.name   # assuming the user model has a name
  #  	user.image = auth.info.image # assuming the user model has an image
      user.skip_confirmation!
    	user.save!
  	end
    end
	end


end
