Temp::Application.routes.draw do
    root :to => 'home#public'

    match '/home' => 'home#index', :as => :home
    match '/home/about' => 'home#about', :as => :about


    match '/auth/:provider/callback'  => 'sessions#create'
    match '/auth/failure'             => 'sessions#failure'
    match '/signout'                  => 'sessions#destroy',  :as => :signout
    match '/signin'                   => 'sessions#new',      :as => :signin


    get   '/home/event/new'         => 'event#new',     :as => :new_event
    post  '/home/event/create'      => 'event#create',  :as => :create_event
    get   '/home/event/:id'         => 'event#show',    :as => :show_event
    get   '/home/event/delete/:id'  => 'event#delete',  :as => :delete_event
    get   '/home/event/:id/update_name' => 'event#update_name', :as => :update_name_event
    post  '/home/event/:id/update_name_save' => 'event#update_name_save', :as => :update_name_save_event
    get   '/home/event/:id/update_type' => 'event#update_type', :as => :update_type_event
    post  '/home/event/:id/update_type_save' => 'event#update_type_save', :as => :update_type_save_event
    get   '/home/event/:id/update_start_time' => 'event#update_start_time', :as => :update_start_time_event
    post  '/home/event/:id/update_start_time_save' => 'event#update_start_time_save', :as => :update_start_time_save_event
    get   '/home/event/:id/update_end_time' => 'event#update_end_time', :as => :update_end_time_event
    post  '/home/event/:id/update_end_time_save' => 'event#update_end_time_save', :as => :update_end_time_save_event
    get   '/home/event/:id/update_cost' => 'event#update_cost', :as => :update_cost_event
    post  '/home/event/:id/update_cost_save' => 'event#update_cost_save', :as => :update_cost_save_event
    get   '/home/event/:id/update_location' => 'event#update_location', :as => :update_location_event
    post  '/home/event/:id/update_location_save' => 'event#update_location_save', :as => :update_location_save_event
    get   '/home/event/:id/update_description' => 'event#update_description', :as => :update_description_event
    post  '/home/event/:id/update_description_save' => 'event#update_description_save', :as => :update_description_save_event
    get   '/home/event/:id/update_registration_deadline' => 'event#update_registration_deadline', :as => :update_registration_deadline_event
    post  '/home/event/:id/update_registration_deadline_save' => 'event#update_registration_deadline_save', :as => :update_registration_deadline_save_event
    get   '/home/event/:id/update_food' => 'event#update_food', :as => :update_food_event
    post  '/home/event/:id/update_food_save' => 'event#update_food_save', :as => :update_food_save_event

    get   '/home/search' => 'home#search', :as => :search_home
    post  '/home/search_results' => 'home#search_results', :as => :search_results_home

    get   '/home/event/:id/host/new'  => 'host#new',  :as => :new_host
    post  '/home/event/:id/host/create' => 'host#create', :as => :create_host
    get   '/home/event/:id/host/delete/' =>'host#delete', :as => :delete_host

    get   '/home/event/:id/sponsor/new'  => 'sponsor#new',  :as => :new_sponsor
    post  '/home/event/:id/sponsor/create' => 'sponsor#create', :as => :create_sponsor
    get   '/home/event/:id/sponsor/delete/' =>'sponsor#delete', :as => :delete_sponsor

    get   '/home/event/:id/speaker/new'  => 'speaker#new',  :as => :new_speaker
    post  '/home/event/:id/speaker/create' => 'speaker#create', :as => :create_speaker
    get   '/home/event/:id/speaker/delete/' =>'speaker#delete', :as => :delete_speaker

    get   '/home/event/:id/artist/new'  => 'artist#new',  :as => :new_artist
    post  '/home/event/:id/artist/create' => 'artist#create', :as => :create_artist
    get   '/home/event/:id/artist/delete/' =>'artist#delete', :as => :delete_artist

    get  '/home/person/new'    => 'person#new',    :as => :new_person
    post '/home/person/create' => 'person#create', :as => :create_person
    get  '/home/person/delete/:id'  => 'person#delete',  :as => :delete_person 
    get  '/home/person/:id'   =>  'person#show',  :as =>  :show_person
    get   '/home/person/:id/update_name' => 'person#update_name', :as => :update_name_person
    post  '/home/person/:id/update_name_save' => 'person#update_name_save', :as => :update_name_save_person
    get   '/home/person/:id/update_address' => 'person#update_address', :as => :update_address_person
    post  '/home/person/:id/update_address_save' => 'person#update_address_save', :as => :update_address_save_person
    get   '/home/person/:id/update_email' => 'person#update_email', :as => :update_email_person
    post  '/home/person/:id/update_email_save' => 'person#update_email_save', :as => :update_email_save_person
    get   '/home/person/:id/update_phone' => 'person#update_phone', :as => :update_phone_person
    post  '/home/person/:id/update_phone_save' => 'person#update_phone_save', :as => :update_phone_save_person
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
