Rails.application.routes.draw do

  #get 'sessions/new'
  get 'login/:locale',    :to => 'sessions#new',      :as => 'login'
  #get  'login',    :to => 'sessions#new',      :as => 'login'
  get  'logout',   :to => 'sessions#destroy',  :as => 'logout'
  post 'sessions', :to => 'sessions#create',   :as => 'sessions'
  get  'products', :to => 'products#index',    :as => 'products'
  get  'cart',     :to => 'cart_products#index',:as => 'cart'

  #resources :users
  #root 'welcome#index'
  scope "(:locale)", :locale => /ja|en/ do
     resources :users
  end

  root 'pages#index'
  get 'userid/:locale',   :to => 'pages#userid', :as => 'userid'
  #get  'userid',   :to => 'pages#userid', :as => 'userid'
  get 'stores', :to => 'stores#index', :as => 'stores'
  get 'store/:id',  :to => 'stores#show',  :as => 'store'

  get 'coupons', :to => 'coupons#index', :as => 'coupons'
  get 'addtocart/:pid', :to => 'cart_products#add'  , :as=> 'addtocart'
  get 'remove/:id', :to => 'cart_products#remove', :as => 'remove'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
