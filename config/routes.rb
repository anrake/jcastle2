Jcastle2::Application.routes.draw do
<<<<<<< HEAD
=======
  get "castle/index"
  get "castle/show"
  get "castle/edit"
  get "castle/update"
  get "castle/new"
  get "castle/create"
>>>>>>> e1055ad651aab841ba4bd0a57de8ea13256ba552
  resources :castles
  
  root :to => "home#index"
#  devise_for :users, :controllers => {:registrations => "registrations"}
#  devise_for :users

#  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

	devise_for :users, :controllers => {
    registrations: "registrations", 
  #  passwords: "users/passwords", 
    omniauth_callbacks: "users/omniauth_callbacks"
  }

#  devise_scope :user do 
#  	get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#  end

  resources :users

  namespace :admin do
  	resources :castles
	end

end