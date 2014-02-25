Project2::Application.routes.draw do
  
 root to: "meets#index"
  
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :invites, :meets

  post "/select_contacts/" => 'invites#select_contacts', as: :select_contacts
  get "/contacts" => 'invites#contacts' 
  get "/getcontacts" => "meets#contacts"


 

  end

