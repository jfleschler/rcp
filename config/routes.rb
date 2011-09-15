Rcp::Application.routes.draw do
  match '/about',      :to => 'pages#about'
  match '/contact',    :to => 'pages#contact'
  match '/signup',     :to => 'users#new'
  match '/signin',     :to => 'sessions#new'
  match '/signout',    :to => 'sessions#destroy'

  resources :sessions,     :only => [:new, :create, :destroy]
  resources :ingredients
  resources :associations, :only => [:new, :update]
  resources :users 

  resources :steps,          :only => [:update] do
    post :prioritize, :on => :collection
    #post :save_note, :on => :collection
  end
  resources :recipes,        :only => [:update] do
    post :prioritize, :on => :collection
  end

  resources :recipes, :except => [:update] do
    resources :steps, :except => [:update] do
      resources :associations, :except => [:new, :update]
    end
  end
  
  match 'recipes/:id/toggle' => 'recipes#toggle'
  match 'recipes/:id/create_ingredient' => 'recipes#create_ingredient'
  match 'recipes/:id/remove_ingredient' => 'recipes#remove_ingredient'
  match 'steps/save_note' => 'steps#save_note'

  root :to => 'pages#home'
  
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
  # match ':controller(/:action(/:id(.:format)))'
end
