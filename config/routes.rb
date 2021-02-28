Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'registrations',
    confirmations: 'confirmations'
  }

  root 'posts#index'

  resources :posts do
    member do
      patch :update, :controller => "complete" 
      get :confirm_email
    end
  end

end
