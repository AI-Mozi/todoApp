Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  root 'posts#index'

  resources :posts do
    member do
      patch :update, :controller => "complete" 
    end
  end

end
