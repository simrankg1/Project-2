Project2::Application.routes.draw do
  
 root to: "meets#index"
  
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :invites, :meets

  post "/select_contacts/" => 'invites#select_contacts', as: :select_contacts
  get "/contacts" => 'invites#contacts' 
  get "/getcontacts" => "meets#contacts"

  get '/newcontact', to: 'contacts#new'
  post '/addcontact', to: 'contacts#add', as: :add_contact
  get '/updatecontact/:id', to: 'contacts#update'
  get '/contact/:id', to: 'contacts#show'
  get 'invites/:id/confirm', to: 'invites#confirm' 
  devise_scope :user do
    get "/users/sign_out", :to => "devise/sessions#destroy"
  end
  end

