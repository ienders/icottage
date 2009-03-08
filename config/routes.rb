ActionController::Routing::Routes.draw do |map|
  map.resources :users, :accounts, :bookings
  
  map.root :controller => 'bookings'
  
  map.signup   '/signup', :controller => 'users',    :action => 'new'
  map.login    '/login',  :controller => 'accounts', :action => 'new'
  map.logout   '/logout', :controller => 'accounts', :action => 'destroy'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
