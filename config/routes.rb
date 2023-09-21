Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "trips#index"
  resources :trips do 
    member do 
      post :reassign
      patch :checkin 
      patch :checkout
    end 
  end 
end
