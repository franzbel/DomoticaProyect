DomoticaProyect::Application.routes.draw do

  resources :clients

  #devise_for :users
  devise_for :users #, :skip => [:sessions]
    #as :user do
      #get 'signin' => 'devise/sessions#new', :as => :new_user_session
      #post 'signin' => 'devise/sessions#create', :as => :user_session
      #delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
      #match 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session,
      #:via => Devise.mappings[:user].sign_out_via
    #end

  root 'principals#index'

  get '/manager/users_list' => 'manager#users_list'
  get '/manager/show_user/:id' => 'manager#show_user'
  get '/manager/delete_user/:id' => 'manager#delete_user'
  get '/manager/enable_user/:id' => 'manager#enable_user'
  get '/manager/disable_user/:id' => 'manager#disable_user'
  get '/manager/change_role/:id' => 'manager#change_role'

  resources :manager

  resources :thermostat_histories

  #post '/thermostat_histories/create' => 'thermostat_histories#create'

  resources :locations do
    resources :thermostats  
  end

  post '/alerts/lala' => 'alerts#lala'
  get '/alerts/setting_alert' => 'alerts#setting_alert'
  resources :alerts


  get '/temperatures/edit/:id' => 'temperatures#edit'

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
