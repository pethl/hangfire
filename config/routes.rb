Hangfire::Application.routes.draw do
  resources :orderitems

  resources :saleproducts

  resources :orders

  resources :eventplates

  resources :eventproducts

  resources :eventplanners do
    	resources :eventplates
  	end

  resources :plates do
    	resources :productlinks
  	end

  resources :productitems do
    		 collection { post :import }
  		 end
  		 
  resources :friendships
  resources :productlinks

  resources :categories

  resources :ingredients do
    		 collection { post :import }
   	end
   	
  
  resources :vendors

  resources :baseproducts do
    		 collection { post :import }
   	end

  resources :items

  resources :products do
     		resources :items;
     		resources :friendships
   		end
  
  resources :orders do
        collection { post :dothat }
   end
  
   resources :orders do
         collection { post :payment }
    end
    
    resources :saleproducts do
       		 collection { post :import }
      	end
    
  
  resources :users
  
   get '/home' => 'static_pages#home'
   get '/help' => 'static_pages#help'
   get '/dashboard' => 'static_pages#dashboard'
  get '/xmas_order' => 'static_pages#xmas_order'
  
  resources :sessions, only: [:new, :create, :destroy]

     get '/signup',  to: 'users#new'
     get '/signin',  to: 'sessions#new'
     delete '/signout', to: 'sessions#destroy'
     get    'signup'  => 'users#new'
     get    'login'   => 'sessions#new'
     post   'login'   => 'sessions#create'
     delete 'logout'  => 'sessions#destroy'
     
     get "static_pages/home"
     get "static_pages/help"
     get "static_pages/dashboard"
     get "static_pages/xmas_order"

  

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
     root :to => 'static_pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
