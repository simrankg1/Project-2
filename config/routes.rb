Project2::Application.routes.draw do
  
 root to: "meets#index"
  
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :invites, :meets 

 

  end

