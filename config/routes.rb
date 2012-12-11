SalesListingApp::Application.routes.draw do

    resources :products
    resources :purchases
    resources :users
    resources :sessions

    root :to => 'pages#home'
    match 'purchases/:id' => 'purchases#create', :as => :buy
    match '/home', :to => 'pages#home'
    match '/about', :to => 'pages#about'
    match '/contact', :to => 'pages#contact'
    match '/privacy', :to => 'pages#privacy'
    match '/signup', :to => 'users#new'
    match '/login', :to => 'sessions#new'
    match '/logout', :to => 'sessions#destroy'
end
