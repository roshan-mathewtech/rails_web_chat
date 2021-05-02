Rails.application.routes.draw do
  get 'rooms/show'

  root 'rooms#show'

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  mount ActionCable.server => '/cable'
end
	