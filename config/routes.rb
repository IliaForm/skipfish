Fish::Application.routes.draw do
  resources :sites do 
   put :check, :on => :member
   put :start, :on => :member
   get :result, :on => :member
   get :final, :on => :member
  end

  resource :account, :controller => "users" do
  	post :identificate, :on => :collection
    post :success_payment, :on => :collection
  	put :buy_chances, :on => :member
  	get :pay, :on => :member
 	#match '/payment/(userid=:userid)&(key=:key)', :to => 'users#identificate', :via => :get
  	#match '/payment/(amount=:amount)&(userid=:userid)&(paymentid=:paymentid)&(key=:key)', :to => 'users#success_payment', :via => :get

  end

  resource :user_session
  root :to => "user_sessions#new"
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
