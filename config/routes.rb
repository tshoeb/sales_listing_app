SalesListingApp::Application.routes.draw do
  resources :users

  resources :purchases

    root :to => 'pages#home'
    match '/home', :to => 'pages#home'
    match '/about', :to => 'pages#about'
    match '/contact', :to => 'pages#contact'
    match '/privacy', :to => 'pages#privacy'
    match '/signup', :to => 'users#new'
    match '/login', :to => 'sessions#new'
    match '/logout', :to => 'sessions#destroy'


   

end
